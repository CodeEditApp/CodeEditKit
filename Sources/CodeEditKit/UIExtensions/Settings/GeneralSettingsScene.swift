//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SwiftUI
import ExtensionKit

struct GeneralSettingsScene<Content: View>: AppExtensionScene {

    @ViewBuilder
    let content: () -> Content

    init(content: @escaping () -> Content) {
        self.content = content
    }

    var connection: NSXPCConnection?
    var environmentWrapper = EnvironmentPublisher()

    var body: some AppExtensionScene {
        PrimitiveAppExtensionScene(id: "Settings") {
            GeneralSettingsView(environmentWrapper: environmentWrapper) {
                Form {
                    content()
                }
                .formStyle(.grouped)
            }
        } onConnection: { connection in
            connection.exportedInterface = .init(with: EnvironmentPublisherObjc.self)
            connection.exportedObject = environmentWrapper
            connection.resume()

            return true
        }
    }
}
