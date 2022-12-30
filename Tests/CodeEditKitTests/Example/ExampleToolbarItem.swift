//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI
import CodeEditKit

struct ExampleToolbarItem: CEToolbarItem {
    var id: String = "PlayItem"
    var placement: ToolbarItemPlacement = .principal
    var body: some View {
        Button("Test") {

        }
    }
}
