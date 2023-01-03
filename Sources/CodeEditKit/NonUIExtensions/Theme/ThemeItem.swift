//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI

public protocol ThemeItem: GenericExtension {
    var colors: [NSColor] { get }
}
