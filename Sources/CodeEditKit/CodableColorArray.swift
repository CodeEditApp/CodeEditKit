//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import AppKit

@propertyWrapper
public struct CodableColorArray {
    public var wrappedValue: [NSColor]

    public init(wrappedValue: [NSColor]) {
        self.wrappedValue = wrappedValue
    }
}

extension CodableColorArray: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let data = try container.decode(Data.self)

        guard let color = try NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: NSColor.self, from: data) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid color"
            )
        }
        wrappedValue = color
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let data = try NSKeyedArchiver.archivedData(withRootObject: wrappedValue, requiringSecureCoding: true)
        try container.encode(data)
    }
}
