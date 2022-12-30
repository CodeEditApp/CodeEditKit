//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import AnyCodable
import SwiftUI

public struct _CEEnvironment: Codable, Equatable {
    public var test = false
    public var complexValue: Array<String> = []

    var otherKeys: [String: AnyCodable] = [:]

    mutating func update<Value>(_ keyPath: WritableKeyPath<Self, Value>, _ value: Value) {
        self[keyPath: keyPath] = value
    }

    public subscript<K>(key: K.Type) -> K.Value where K : CEEnvironmentKey {
        get {
            guard let data = otherKeys[key.identifier] else { return key.defaultValue }
            return data.value as! K.Value
        }
        set { otherKeys[key.identifier] = AnyCodable(newValue) }
    }
}

@propertyWrapper
public struct CEEnvironment<Value> : DynamicProperty {
    @Environment(\._ceEnvironment) var environment

    public init(_ keyPath: KeyPath<_CEEnvironment, Value>) {
        self.keyPath = keyPath
    }

    let keyPath: KeyPath<_CEEnvironment, Value>

    public var wrappedValue: Value {
        environment[keyPath: keyPath]
    }
}

public struct _CEEnvironmentKey: EnvironmentKey {
    public static let defaultValue = _CEEnvironment()
}

public extension EnvironmentValues {
    var _ceEnvironment: _CEEnvironmentKey.Value {
        get {
            return self[_CEEnvironmentKey.self]
        }
        set {
            self[_CEEnvironmentKey.self] = newValue
        }
    }
}
