//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import ConcurrencyPlus

@objc public protocol EnvironmentPublisherObjc {
    func publishEnvironment(data: Data)
}

public class EnvironmentPublisher: ObservableObject, EnvironmentPublisherObjc {

    @Published var environment = _CEEnvironment()

    var connection: NSXPCConnection?

    /// Send callbacks from functions
    func update(@Encoded callback: Callbacks) async throws {
        guard let $callback else { return }
        try await connection!.withService { (service: EnvironmentPublisherObjc) in
            service.publishEnvironment(data: $callback)
        }
    }

    public func publishEnvironment(@Decoded<_CEEnvironment> data: Data) {
        guard let $data else { return }
        environment = $data
        
        print("update: received data \($data)")
    }
}

