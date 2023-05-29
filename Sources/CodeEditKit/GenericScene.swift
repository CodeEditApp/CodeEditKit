//
//  File.swift
//  
//
//  Created by Wouter Hennen on 02/01/2023.
//

import SwiftUI
import ExtensionKit

public enum Callbacks: Codable {
    case openWindow(id: String)
}

struct GenericScene<Content: View>: AppExtensionScene {

    var sceneID: String

    @ViewBuilder
    var content: Content

    var environmentWrapper = EnvironmentPublisher()

    var connection: NSXPCConnection?

    var body: some AppExtensionScene {
        PrimitiveAppExtensionScene(id: sceneID) {
            GeneralSettingsView(environmentWrapper: environmentWrapper) {
                content
                    .environment(\.ceOpenWindow) { id in
                        try await environmentWrapper.update(callback: .openWindow(id: id))
                    }
            }
        } onConnection: { connection in
            connection.exportedInterface = .init(with: EnvironmentPublisherObjc.self)
            connection.remoteObjectInterface = .init(with: EnvironmentPublisherObjc.self)
            connection.exportedObject = environmentWrapper
            environmentWrapper.connection = connection
            connection.resume()

            return true
        }
    }
}
