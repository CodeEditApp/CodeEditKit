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
    }

    var availableExtensions: [ExtensionKind] {
        sidebars.resolve(environment: self).map(\.extensionKind)
    }
}
