//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SequenceBuilder

public protocol Nameable {
    var name: String { get }
}

extension Either: Nameable where Left: Nameable, Right: Nameable {
    public var name: String {
        fold(left: \.name, right: \.name)
    }
}
