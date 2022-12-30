//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SequenceBuilder

extension Either: SidebarItem where Left: SidebarItem, Right: SidebarItem {

    public var icon: String {
        fold(left: \.icon, right: \.icon)
    }
}
