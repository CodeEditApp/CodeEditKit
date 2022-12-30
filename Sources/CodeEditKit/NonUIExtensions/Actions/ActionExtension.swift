//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SequenceBuilder

public protocol ActionExtension {
    associatedtype ActionsBody: Sequence where ActionsBody.Element: CEAction

    @SequenceBuilder
    var actions: ActionsBody { get }
}
