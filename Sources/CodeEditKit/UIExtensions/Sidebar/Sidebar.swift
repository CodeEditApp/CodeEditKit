//
//  File.swift
//  
//
//  Created by Wouter Hennen on 24/03/2023.
//

import Foundation
//import SwiftUI
import ExtensionKit

public protocol Sidebar {
    associatedtype Body: Sidebar

    @SidebarBuilder
    var body: Body { get }

    @_spi(CodeEdit)
    func resolve(environment: some ObservableObject) -> [ResolvedSidebar]
}

public struct ResolvedSidebar {

    enum Kind {
        case navigator, inspector
    }
//    typealias Scene: AppExtensionScene
    var scene: PrimitiveAppExtensionScene

    var id: String

    var icon: String

    var help: String?

    var kind: Kind

    var extensionKind: ExtensionKind {
        .sidebarItem(sceneID: id, icon: icon)
    }
}


extension Never: Sidebar {
    @_spi(CodeEdit)
    public func resolve(environment: some ObservableObject) -> [ResolvedSidebar] {
        fatalError()
    }
}

public extension Sidebar {
//    @_spi(CodeEdit)
    func resolve(environment: some ObservableObject) -> [ResolvedSidebar] {
        body.resolve(environment: environment)
    }
}



struct TupleSidebar<C0: Sidebar, C1: Sidebar>: Sidebar {
    var c0: C0
    var c1: C1

    init(_ c0: C0, _ c1: C1) {
        self.c0 = c0
        self.c1 = c1
    }

    var body: Never {
        fatalError()
    }

    func resolve(environment: some ObservableObject) -> [ResolvedSidebar] {
        c0.resolve(environment: environment) + c1.resolve(environment: environment)
    }
}

@resultBuilder
public struct SidebarBuilder {
    static func buildBlock(_ c0: Never) -> Never {}

    static public func buildBlock<C0: Sidebar>(_ c0: C0) -> some Sidebar {
        c0
    }

    static public func buildBlock<C0: Sidebar, C1: Sidebar>(_ c0: C0, _ c1: C1) -> some Sidebar {
        TupleSidebar(c0, c1)
    }

    static public func buildBlock<C0: Sidebar, C1: Sidebar, C2: Sidebar>(_ c0: C0, _ c1: C1, _ c2: C2) -> some Sidebar {
        TupleSidebar(TupleSidebar(c0, c1), c2)
    }
}



