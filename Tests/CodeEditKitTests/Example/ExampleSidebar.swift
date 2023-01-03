//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI
import CodeEditKit

struct ExampleSidebar: SidebarItem {
    var icon: String = "star"
    var label: String = "Example Sidebar"
    var description: String = "This is a description of the sidebar"
    var body: some View {
        Text("Piep")
    }
}
