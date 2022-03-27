//
//  ExtensionInterface.swift
//  
//
//  Created by Pavel Kasila on 27.03.22.
//

import Foundation

/// A protocol for extensions to conform to
public protocol ExtensionInterface {

    /// Initializes extension with API
    /// - Parameter withAPI: the API implementation itself
    init(withAPI api: ExtensionAPI) throws

}

open class ExtensionBuilder {

    public init() {}

    open func build() -> ExtensionInterface {
        fatalError("You should override ExtensionBuilder.build")
    }
}
