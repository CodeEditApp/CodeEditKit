//
//  File.swift
//  
//
//  Created by Wouter Hennen on 24/03/2023.
//

import Foundation

extension Swift.Never: Sidebar {

    public var body: Swift.Never {
        fatalError()
    }

    @_spi(CodeEdit)
    public func resolve(environment: some ObservableObject) -> [ResolvedSidebar] {
        fatalError()
    }
}
