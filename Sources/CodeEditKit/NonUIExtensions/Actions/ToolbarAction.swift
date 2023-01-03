//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation

public struct ToolbarAction: CEAction {
    public var kind: ActionKind = .toolbar

    public var label: String
    public var id: String { "toolbar\(label)"}

    public var description: String
    public var action: () -> Void

    public init(_ label: String, description: String = "Toolbar action", action: @escaping () -> Void) {
        self.label = label
        self.description = description
        self.action = action
    }
}
