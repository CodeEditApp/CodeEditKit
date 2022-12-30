//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI
import CodeEditKit

struct ExampleSidebar: SidebarItem {
    var id: String = "TestTest"
    var icon: String = "Test"
    var body: some View {
        Text("Piep")
    }
}
