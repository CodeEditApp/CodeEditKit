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

public protocol CodeEditExtension: AppExtension {

    associatedtype Body: AppExtensionScene
    associatedtype Configuration = AppExtensionSceneConfiguration

    var description: String { get }
    var entitlements: [Entitlement] { get }


    @AppExtensionSceneBuilder
    var body: Body { get }
}

extension CodeEditExtension {
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

public extension CodeEditExtension{
    var configuration: AppExtensionSceneConfiguration {
        AppExtensionSceneConfiguration(self.body, configuration: SettingsExtensionConfiguration(self))
    }
}

public struct SettingsExtensionConfiguration<E: CodeEditExtension>: AppExtensionConfiguration {
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



