//
//  File.swift
//  
//
//  Created by Wouter Hennen on 24/03/2023.
//

import Foundation

@resultBuilder
public struct SidebarBuilder {
    public static func buildPartialBlock(first: Never) -> Never {}

    public static func buildPartialBlock(first: some Sidebar) -> some Sidebar {
        first
    }

    public static func buildPartialBlock(accumulated: some Sidebar, next: some Sidebar) -> some Sidebar {
        TupleSidebar(accumulated, next)
    }
}
