//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SwiftUI
import ExtensionKit

public protocol SettingsExtension: ObservableObject {
    associatedtype SettingsBody: View

    @ViewBuilder
    var settings: SettingsBody { get }
}

public extension SettingsExtension {
    var settingsScene: some AppExtensionScene {
        GenericScene(sceneID: "Settings") {
            Form {
                self.settings
                    .environmentObject(self)
            }
            .formStyle(.grouped)
        }
    }
}
