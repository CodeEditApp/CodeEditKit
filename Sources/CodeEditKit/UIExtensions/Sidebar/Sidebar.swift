//
//  File.swift
//  
//
//  Created by Wouter Hennen on 24/03/2023.
//

import Foundation
import ExtensionKit

public protocol Sidebar {
    associatedtype Body: Sidebar

    @SidebarBuilder
    var body: Body { get }

    @_spi(CodeEdit)
    func resolve(environment: some ObservableObject) -> [ResolvedSidebar]
}

public extension Sidebar {

//    @_spi(CodeEdit)
    func resolve(environment: some ObservableObject) -> [ResolvedSidebar] {
        body.resolve(environment: environment)
    }
}
