//
//  File.swift
//  
//
//  Created by Wouter Hennen on 02/01/2023.
//

import SwiftUI

public struct CEEnvironmentModifier<Value>: ViewModifier {
    var keyPath: WritableKeyPath<_CEEnvironment, Value>
    var value: Value

    public func body(content: Content) -> some View {
        content
            .transformEnvironment(\._ceEnvironment) { env in
                env.update(keyPath, value)
            }
    }
}

public extension View {
    func ceEnvironment<Value>(_ keyPath: WritableKeyPath<_CEEnvironment, Value>, _ value: Value) -> some View {
        return modifier(CEEnvironmentModifier(keyPath: keyPath, value: value))
    }
}
