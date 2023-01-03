//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation

public struct ShortcutAction: CEAction {
    public var kind: ActionKind = .shortcut

    public var label: String
    public var id: String { "shortcut\(label)"}

    public var description: String

    public var action: () -> Void

    public init(_ label: String, description: String = "Short description", action: @escaping () -> Void) {
        self.label = label
        self.description = description
        self.action = action
    }
}
