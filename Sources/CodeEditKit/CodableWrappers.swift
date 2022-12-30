//
//  File 2.swift
//  
//
//  Created by Wouter Hennen on 06/12/2022.
//

import Foundation

@propertyWrapper
public struct Encoded<T: Encodable> {
    public var wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }

    public var errorDescription: String? {
        do {
            _ = try JSONEncoder().encode(wrappedValue)
            return nil
        } catch {
            return error.localizedDescription
        }
    }

    public var projectedValue: Data? {
        try? JSONEncoder().encode(wrappedValue)
    }
}

@propertyWrapper
public struct Decoded<T: Decodable> {
    public var wrappedValue: Data

    public init(wrappedValue: Data) {
        self.wrappedValue = wrappedValue
    }

    public var errorDescription: String? {
        do {
            _ = try JSONDecoder().decode(T.self, from: wrappedValue)
            return nil
        } catch {
            return error.localizedDescription
        }
    }

    public var projectedValue: T? {
        try? JSONDecoder().decode(T.self, from: wrappedValue)
    }
}
