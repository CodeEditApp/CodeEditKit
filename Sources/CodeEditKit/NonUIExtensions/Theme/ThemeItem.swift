//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI

public protocol ThemeItem: Identifiable, Nameable where ID == String {
    var id: ID { get }
    var name: String { get }
    var colors: [NSColor] { get }
}
