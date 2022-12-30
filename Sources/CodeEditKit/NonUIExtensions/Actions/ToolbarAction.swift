//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation

public struct ToolbarAction: CEAction {
    public var kind: ActionKind = .toolbar

    public var name: String
    public var id: String { "toolbar\(name)"}

    public var action: () -> Void

    public init(name: String, action: @escaping () -> Void) {
        self.name = name
        self.action = action
    }
}
