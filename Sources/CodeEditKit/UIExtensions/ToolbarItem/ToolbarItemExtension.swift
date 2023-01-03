//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SequenceBuilder
import ExtensionKit

public protocol ToolbarItemExtension: ObservableObject {

    associatedtype ToolbarItemBody: Sequence where ToolbarItemBody.Element: CEToolbarItem

    @SequenceBuilder
    var toolbaritems: ToolbarItemBody { get }
}

extension ToolbarItemExtension {
    public var toolbarItemScenes: some AppExtensionScene {
        toolbaritems.map { nav in
            PrimitiveAppExtensionScene(id: nav.id) {
                nav.body
                    .environmentObject(self)
            }
        }
    }

    var availableExtensions: [ExtensionKind] {
        toolbaritems.map { ExtensionKind.toolbarItem(sceneID: $0.id, placement: $0.placement) }
    }
}
