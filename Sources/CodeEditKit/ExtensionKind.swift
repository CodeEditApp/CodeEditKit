//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI

public enum ExtensionKind: Codable {
    case sidebarItem(sceneID: String)
    case toolbarItem(sceneID: String, placement: CEToolbarItemPlacement)
    case action(actionID: String)
    case theme(themeID: String)
    case settings
}


