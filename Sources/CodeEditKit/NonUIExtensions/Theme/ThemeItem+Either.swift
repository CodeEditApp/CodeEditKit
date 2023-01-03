//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI
import SequenceBuilder

extension Either: ThemeItem where Left: ThemeItem, Right: ThemeItem {

    public var colors: [NSColor] {
        fold(left: \.colors, right: \.colors)
    }
}
