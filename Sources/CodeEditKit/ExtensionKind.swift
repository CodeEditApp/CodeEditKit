//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI

public enum ExtensionKind: Codable, Hashable, CustomStringConvertible {
    case sidebarItem(data: ResolvedSidebar.SidebarStore)
    case action(actionID: String)
    case theme(themeID: String)
    case settings

    public var description: String {
        switch self {
        case .sidebarItem(let data):
            return "Sidebar with ID \(data.sceneID)"
        case .action(let actionID):
            return "Action with ID \(actionID)"
        case .theme(let themeID):
            return "Theme with ID \(themeID)"
        case .settings:
            return "Settings"
        }
    }
}


