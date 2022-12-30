//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI
import ExtensionKit
import CodeEditKit

//@main
struct ExampleExtension: CodeEditExtension {
    var description: String = "test"

    var entitlements: [Entitlement] = [.currentfile]

    var body: some AppExtensionScene {
        sidebarScenes
        toolbarItemScenes
    }
}

extension ExampleExtension: SidebarExtension {
    var sidebars: [some SidebarItem] {
        ExampleSidebar()
    }
}

extension ExampleExtension: ActionExtension {
    var actions: [some CEAction] {
        ShortcutAction(name: "Test") {
            print("Blablabla")
        }

        ShortcutAction(name: "Test2") {
            print("Blablabla")
        }

        ToolbarAction(name: "Test") {
            print("Hello")
        }
    }
}

extension ExampleExtension: ToolbarItemExtension {
    var toolbaritems: [some CEToolbarItem] {
        ExampleToolbarItem()
    }
}

extension ExampleExtension: ThemeExtension {
    var themes: [some ThemeItem] {
        XcodeLightTheme()
    }
}

struct XcodeLightTheme: ThemeItem {
    var id: String = "XcodeLightTheme"
    var name: String = "Xcode Light Theme"
    var colors: [Color] = [.blue]
}




