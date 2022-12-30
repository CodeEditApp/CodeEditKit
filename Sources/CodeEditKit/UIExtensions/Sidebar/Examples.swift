//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SwiftUI

struct DefaultNavigator: SidebarItem {
    var id: String = "TestTest"
    var icon: String = "Test"
    var body: some View {
        Text("Piep")
    }
}

struct DefaultNavigator2: SidebarItem {
    var id: String = "Hello"
    var icon: String = "Test"
    var body: some View {
        Text("Piep2")
    }
}
