//
//  File.swift
//  
//
//  Created by Wouter Hennen on 02/01/2023.
//

import Foundation
import SequenceBuilder

public protocol GenericExtension: Identifiable, CustomStringConvertible where ID == String {
    var label: String { get }
}

public extension GenericExtension {
    var id: String {
        String(describing: Self.self)
    }
}

extension Either: GenericExtension where Left: GenericExtension, Right: GenericExtension {
    public var label: String {
        fold(left: \.label, right: \.label)
    }
}
