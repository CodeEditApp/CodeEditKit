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

        ShortcutAction("Test") {
            print("Blablabla")
        }

        ShortcutAction("Test2") {
            print("Blablabla")
        }

        ToolbarAction("Test") {
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

    var label: String = "Xcode Light Theme"

    var description: String = "This is the Xcode light theme"
    
    var colors: [NSColor] = [.blue]
}




