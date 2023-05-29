//
//  File.swift
//  
//
//  Created by Wouter Hennen on 24/03/2023.
//

import Foundation
import ExtensionKit

public struct ResolvedSidebar {

    public enum Kind: Codable, Hashable {
        case navigator, inspector
    }

    var scene: PrimitiveAppExtensionScene

    var store: SidebarStore

    public struct SidebarStore: Codable, Hashable {
        public var sceneID: String
        public var icon: String?
        public var help: String?
        public var kind: Kind
    }

    var extensionKind: ExtensionKind {
        .sidebarItem(data: store)
    }
}
