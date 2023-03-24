//
//  File.swift
//  
//
//  Created by Wouter Hennen on 24/03/2023.
//

import Foundation

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
