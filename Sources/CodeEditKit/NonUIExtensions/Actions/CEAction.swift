//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation

public protocol CEAction: Identifiable, Nameable where ID == String {

    var id: ID { get }
    var name: String { get }
    var kind: ActionKind { get }
    var action: () -> Void { get }
}
