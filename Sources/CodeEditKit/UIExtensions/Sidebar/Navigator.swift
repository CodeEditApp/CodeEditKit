//
//  File.swift
//  
//
//  Created by Wouter Hennen on 25/03/2023.
//

import SwiftUI
import ExtensionKit

public struct Navigator<Content: View>: Sidebar {
    public var body: Never {
        fatalError()
    }

    var id: String

    var icon: String

    public init(id: String, icon: String, content: () -> Content) {
        self.id = id
        self.icon = icon
        self.content = content()
    }

    @ViewBuilder var content: Content

    @_spi(CodeEdit)
    public func resolve(environment: some ObservableObject) -> [ResolvedSidebar] {
        let scene = PrimitiveAppExtensionScene(id: id) {
            VStack(alignment: .leading) {
                content
                    .scrollContentBackground(.hidden)
                    .environmentObject(environment)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        let store = ResolvedSidebar.SidebarStore(sceneID: id, kind: .navigator)
        return [ResolvedSidebar(scene: scene, store: store)]
    }
}
