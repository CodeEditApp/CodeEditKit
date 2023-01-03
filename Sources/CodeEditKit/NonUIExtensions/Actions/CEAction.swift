//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation

public protocol CEAction: GenericExtension {

    var kind: ActionKind { get }
    var action: () -> Void { get }
}
