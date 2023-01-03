//
//  File.swift
//  
//
//  Created by Wouter Hennen on 02/01/2023.
//

import Foundation
import SwiftUI

public struct CEOpenWindowEnvKey: EnvironmentKey {
    public static var defaultValue: (String) async throws -> Void = { _ in }
}

public extension EnvironmentValues {
    var ceOpenWindow: CEOpenWindowEnvKey.Value {
        get { self[CEOpenWindowEnvKey.self] }
        set { self[CEOpenWindowEnvKey.self] = newValue }
    }
}
