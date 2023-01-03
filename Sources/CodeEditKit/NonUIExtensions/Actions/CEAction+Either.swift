//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SequenceBuilder

extension Either: CEAction where Left: CEAction, Right: CEAction {

    public var kind: ActionKind {
        fold(left: \.kind, right: \.kind)
    }

    public var action: () -> Void {
        fold(left: \.action, right: \.action)
    }
}
