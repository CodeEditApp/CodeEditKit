//
//  ExtensionManifest.swift
//  
//
//  Created by Pavel Kasila on 27.03.22.
//

import Foundation

public struct ExtensionManifest: Codable, Identifiable, Hashable {
    public var id: String
    public var displayName: String
}
