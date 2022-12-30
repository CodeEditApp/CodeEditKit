//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SwiftUI
import ExtensionKit

protocol SettingsExtension {
    associatedtype SettingsBody: View

    @ViewBuilder
    var settings: SettingsBody { get }
}

extension SettingsExtension {
    var settingsScene: some AppExtensionScene {
        GeneralSettingsScene {
            self.settings
        }
    }
}
