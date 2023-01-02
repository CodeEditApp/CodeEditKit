//
//  File.swift
//  
//
//  Created by Wouter Hennen on 02/01/2023.
//

import SwiftUI
import ExtensionKit

struct GenericScene<Content: View>: AppExtensionScene {

    var sceneID: String

    @ViewBuilder
    var content: Content

    var environmentWrapper = EnvironmentPublisher()

    var body: some AppExtensionScene {
        PrimitiveAppExtensionScene(id: sceneID) {
            GeneralSettingsView(environmentWrapper: environmentWrapper) {
                content
            }
        } onConnection: { connection in
            connection.exportedInterface = .init(with: EnvironmentPublisherObjc.self)
            connection.exportedObject = environmentWrapper
            
            connection.resume()

            return true
        }
    }
}

