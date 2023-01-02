//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SwiftUI

struct DefaultNavigator: SidebarItem {
    var icon: String = "Test"

    var label: String = "Test"
    
    var description: String = "Short description"
    var body: some View {
        Text("Piep")
    }
}

struct DefaultNavigator2: SidebarItem {
    var icon: String = "Test"
    var label: String = "Default Navigator 2"
    var description: String = "blablabla"
    var body: some View {
        Text("Piep2")
    }
}
