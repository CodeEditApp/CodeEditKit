//
//  File.swift
//  
//
//  Created by Wouter Hennen on 24/03/2023.
//

import SwiftUI
import ExtensionKit

struct SidebarHelpModifier<Content: Sidebar>: Sidebar {
    var help: String
    var content: Content

    var body: Never {
        fatalError()
    }

    func resolve(environment: some ObservableObject) -> [ResolvedSidebar] {
        var sidebars = self.content.resolve(environment: environment)
        for index in sidebars.indices {
            sidebars[index].store.help = help
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
