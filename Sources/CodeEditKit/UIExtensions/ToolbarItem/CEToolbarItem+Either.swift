//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI
import SequenceBuilder

extension Either: CEToolbarItem where Left: CEToolbarItem, Right: CEToolbarItem {

    public var placement: CEToolbarItemPlacement {
        fold(left: \.placement, right: \.placement)
    }
}
