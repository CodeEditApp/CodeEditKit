//
//  File.swift
//  
//
//  Created by Wouter Hennen on 27/03/2023.
//

import Foundation
import LanguageClient
import Combine
import OSLog
import ProcessServiceClient
import ConcurrencyPlus
import LanguageServerProtocol
import ProcessEnv
import JSONRPC

protocol LanguageExtension {
    var client: RemoteLanguageServer { get }

}

final class UnrestrictedProcessTransport {
    private var readHandler: ReadHandler = { _ in }
    private let process: HostedProcess
    private let taskQueue = TaskQueue()
    private var subscription: AnyCancellable?
    private let logger = Logger(subsystem: "com.chimehq.ChimeKit", category: "UnrestrictedProcessTransport")

    init(process: HostedProcess) {
        self.process = process
    }

    func beginMonitoringProcess() async throws {
        let task = taskQueue.addOperation {
            self.subscription = try await self.process.processEventPublisher
                .sink(receiveCompletion: { _ in
                }, receiveValue: { [weak self] event in
                    switch event {
                    case .stdout(let data):
                        self?.readHandler(data)
                    case .stderr(let data):
                        let output = String(data: data, encoding: .utf8) ?? ""

                        self?.logger.info("stderr: \(output, privacy: .public)")
                    default:
                        break
                    }
                })
        }

        try await task.value
    }
}

extension UnrestrictedProcessTransport: DataTransport {
    func write(_ data: Data) {
        taskQueue.addOperation {
            try await self.process.write(data)
        }
    }

    func setReaderHandler(_ handler: @escaping ReadHandler) {
        self.readHandler = handler
    }

    func close() {
        subscription?.cancel()
    }
}

/// Provides an interface to a LSP language server hosted by an intermediary process.
public class RemoteLanguageServer {
    private let wrappedServer: JSONRPCLanguageServer
    private var subscription: AnyCancellable?
    private let logger = Logger(subsystem: "com.chimehq.ChimeKit", category: "RemoteLanguageServer")

    private let process: HostedProcess
    private let taskQueue = TaskQueue()
    public var terminationHandler: (() -> Void)?

    init(named serviceName: String, parameters: Process.ExecutionParameters) throws {
        self.process = HostedProcess(named: serviceName, parameters: parameters)
        let transport = UnrestrictedProcessTransport(process: process)
        self.wrappedServer = JSONRPCLanguageServer(dataTransport: transport)

        taskQueue.addOperation {
            self.logger.debug("launching remote server")

            do {
                try await self.process.launch()

                self.subscription = try await self.process.processEventPublisher
                    .sink(receiveCompletion: { _ in

                    }, receiveValue: { event in
                        switch event {
                        case .terminated:
                            self.terminationHandler?()
                        default:
                            break
                        }
                    })

                try await transport.beginMonitoringProcess()
            } catch {
                self.logger.error("failed to launch: \(String(describing: error), privacy: .public)")
            }
        }
    }

    private func stopProcess() {
        self.taskQueue.addOperation {
            do {
                try await self.process.terminate()
            } catch {
                self.logger.error("failed to terminate: \(String(describing: error), privacy: .public)")
            }
        }
    }

    public var logMessages: Bool {
        get { return wrappedServer.logMessages }
        set { wrappedServer.logMessages = newValue }
    }
}

extension RemoteLanguageServer: LanguageServerProtocol.Server {
    public func setHandlers(_ handlers: ServerHandlers, completionHandler: @escaping (ServerError?) -> Void) {
        wrappedServer.setHandlers(handlers, completionHandler: completionHandler)
    }

    public func sendNotification(_ notif: ClientNotification, completionHandler: @escaping (ServerError?) -> Void) {
        taskQueue.addOperation {
            self.wrappedServer.sendNotification(notif, completionHandler: completionHandler)
        }
    }

    public func sendRequest<Response: Codable>(_ request: ClientRequest, completionHandler: @escaping (ServerResult<Response>) -> Void) {
        taskQueue.addOperation {
            self.wrappedServer.sendRequest(request, completionHandler: { (result: ServerResult<Response>) in
                if case .success = result, case .shutdown = request {
                    self.stopProcess()
                }

                completionHandler(result)
            })
        }
    }
}
