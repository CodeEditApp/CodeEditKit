//
//  File.swift
//  
//
//  Created by Wouter Hennen on 24/03/2023.
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
            content
                .environmentObject(environment)
        }
        return [ResolvedSidebar(scene: scene, id: id, icon: icon, kind: .navigator)]
    }
}

public struct Inspector<Content: View>: Sidebar {
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
            content
                .environmentObject(environment)
        }
        return [ResolvedSidebar(scene: scene, id: id, icon: icon, kind: .inspector)]
    }
}

struct SidebarHelpModifier<Content: Sidebar>: Sidebar {
    var help: String
    var content: Content

    var body: Never {
        fatalError()
    }

    func resolve(environment: some ObservableObject) -> [ResolvedSidebar] {
        var sidebars = self.content.resolve(environment: environment)
        for index in sidebars.indices {
            sidebars[index].help = help
        }
        return sidebars
    }
}

public extension Sidebar {
    func help(_ message: String) -> some Sidebar {
        SidebarHelpModifier(help: message, content: self)
    }

    func title(_ title: String) -> some Sidebar {
        self
    }

    func description(_ message: String) -> some Sidebar {
        self
    }
}

struct GroupSidebar: Sidebar {

    var body: some Sidebar {
        Navigator(id: "Hello", icon: "mimi") {
            Text("Hello")
        }
        .help("This shows on hover of icon")
        .title("Navigator 1")
        .description("This is shown in the settings")

        Inspector(id: "Hello2", icon: "mimi") {
            Text("Hello2")
        }
    }
}
