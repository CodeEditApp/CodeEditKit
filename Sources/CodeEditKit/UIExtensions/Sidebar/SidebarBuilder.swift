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

    public static func buildPartialBlock<C0: Sidebar>(first: C0) -> some Sidebar {
        first
    }

    public static func buildPartialBlock<C0: Sidebar, C1: Sidebar>(accumulated: C0, next: C1) -> some Sidebar {
        TupleSidebar(accumulated, next)
    }
}
