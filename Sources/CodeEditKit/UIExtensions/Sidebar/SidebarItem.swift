//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SwiftUI
import ExtensionKit

public protocol SidebarItem: View, GenericExtension {
    var icon: String { get }
}

extension SidebarItem {
    var scene: some AppExtensionScene {
        PrimitiveAppExtensionScene(id: id) {
            VStack(alignment: .leading) {
                self
                    .scrollContentBackground(.hidden)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
