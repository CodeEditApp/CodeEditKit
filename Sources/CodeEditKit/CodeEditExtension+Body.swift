//
//  File.swift
//  
//
//  Created by Wouter Hennen on 03/01/2023.
//

import Foundation
import SequenceBuilder
import ExtensionKit

public extension CodeEditExtension where Self: SettingsExtension {
    var body: some AppExtensionScene {
        settingsScene
    }
}

public extension CodeEditExtension where Self: SidebarExtension {
    var body: some AppExtensionScene {
        sidebarScenes
    }
}

public extension CodeEditExtension where Self: ToolbarItemExtension {
    var body: some AppExtensionScene {
        toolbarItemScenes
    }
}

public extension CodeEditExtension where Self: SettingsExtension & SidebarExtension {
    @AppExtensionSceneBuilder
    var body: some AppExtensionScene {
        settingsScene
        sidebarScenes
    }
}

public extension CodeEditExtension where Self: SettingsExtension & ToolbarItemExtension {
    @AppExtensionSceneBuilder
    var body: some AppExtensionScene {
        settingsScene
        toolbarItemScenes
    }
}

public extension CodeEditExtension where Self: SidebarExtension & ToolbarItemExtension {
    @AppExtensionSceneBuilder
    var body: some AppExtensionScene {
        sidebarScenes
        toolbarItemScenes
    }
}

public extension CodeEditExtension where Self: SettingsExtension & SidebarExtension & ToolbarItemExtension {
    @AppExtensionSceneBuilder
    var body: some AppExtensionScene {
        settingsScene
        sidebarScenes
        toolbarItemScenes
    }
}
