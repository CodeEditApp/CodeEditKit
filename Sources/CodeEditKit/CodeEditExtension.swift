//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import ExtensionKit
import ExtensionFoundation
import SwiftUI
import SequenceBuilder

public protocol CodeEditExtension: AppExtension {

    /// UI scenes of the extension.
    associatedtype Body: AppExtensionScene

    /// Extension Configuration.
    associatedtype Configuration = AppExtensionSceneConfiguration

    /// A brief description of the extension. Should be max a few words.
    var description: String { get }

    /// A list of Entitlements the app needs, e.g. Network Access.
    var entitlements: [Entitlement] { get }

    /// UI scenes of the extension.
    /// Use the default implementation.
    @AppExtensionSceneBuilder
    var body: Body { get }
}

public extension CodeEditExtension {
    static var shared: Self { Self() }
}

extension CodeEditExtension {

    var extensionURL: URL {
        Bundle.main.bundleURL
    }

    func gatherAvailableExtensions() -> [ExtensionKind] {
        var extensions: [ExtensionKind] = []

        if self is any SettingsExtension {
            extensions.append(.settings)
        }

        if let self = self as? any ThemeExtension {
            extensions.append(contentsOf: self.availableExtensions)
        }
        
        if let self = self as? any SidebarExtension {
            extensions.append(contentsOf: self.availableExtensions)
        }

        if let self = self as? any ToolbarItemExtension {
            extensions.append(contentsOf: self.availableExtensions)
        }
        
        return extensions
    }
}

public extension CodeEditExtension {
    /// XPC Configuration for communication with CodeEdit.
    /// Use the default implementation.
    var configuration: AppExtensionSceneConfiguration {
        AppExtensionSceneConfiguration(self.body, configuration: SettingsExtensionConfiguration(self))
    }
}


struct SettingsExtensionConfiguration<E: CodeEditExtension>: AppExtensionConfiguration {
    public func accept(connection: NSXPCConnection) -> Bool {
        connection.exportedInterface = .init(with: XPCWrappable.self)
        connection.exportedObject = XPCWrapper(appExtension)
        connection.resume()

        return true
    }

    let appExtension: E

    /// Creates a default configuration for the given extension.
    /// - Parameter appExtension: An instance of your custom extension that conforms to the ``TextTransformExtension`` protocol.
    public init(_ appExtension: E) {
        self.appExtension = appExtension
    }
}



