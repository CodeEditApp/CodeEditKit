//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SwiftUI

public protocol CEToolbarItem: View, Identifiable where ID == String {
    var id: ID { get }
    var placement: CEToolbarItemPlacement { get }
}

extension CEToolbarItem {
    var mappedID: String {
        "CEToolbarItem_\(id)"
    }

    public var placement: CEToolbarItemPlacement { .automatic }
}
