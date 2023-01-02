//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SequenceBuilder
import ExtensionKit
import SwiftUI

public protocol SidebarExtension {

    associatedtype SidebarBody: Sequence where SidebarBody.Element: SidebarItem

    @SequenceBuilder
    var sidebars: SidebarBody { get }
}



public extension SidebarExtension {
    var sidebarScenes: some AppExtensionScene {
        sidebars.map(\.scene)
    }

    var availableExtensions: [ExtensionKind] {
        sidebars.map { ExtensionKind.sidebarItem(sceneID: $0.id, icon: $0.icon) }
    }
}
