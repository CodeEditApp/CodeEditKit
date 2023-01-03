//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI
import CodeEditKit

struct ExampleToolbarItem: CEToolbarItem {
    var label: String = "Example Toolbar"

    var description: String = "This is the description"

    var placement: ToolbarItemPlacement = .principal
    var body: some View {
        Button("Test") {

        }
    }
}
