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

public protocol SidebarExtension: ObservableObject {

    associatedtype SidebarBody: Sidebar

    @SidebarBuilder
    var sidebars: SidebarBody { get }
}



public extension SidebarExtension {
    var sidebarScenes: some AppExtensionScene {
        sidebars.resolve(environment: self).map(\.scene)
//        sidebars.map { $0.buildScene(with: self) }
    }

    var availableExtensions: [ExtensionKind] {
        sidebars.resolve(environment: self).map(\.extensionKind)
//        sidebars.map { ExtensionKind.sidebarItem(sceneID: $0.id, icon: $0.icon) }
    }
}
