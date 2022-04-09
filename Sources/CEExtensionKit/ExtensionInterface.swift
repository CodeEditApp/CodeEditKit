//
//  ExtensionInterface.swift
//  
//
//  Created by Pavel Kasila on 27.03.22.
//

import Foundation

/// A protocol for extensions to conform to
public protocol ExtensionInterface {
}

public protocol ExtensionBuilderProtocol: NSObject {
    init()
    func build(withAPI api: ExtensionAPI) -> ExtensionInterface
}
