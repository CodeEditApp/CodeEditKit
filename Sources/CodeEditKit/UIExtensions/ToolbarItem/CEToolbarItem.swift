//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SwiftUI

public protocol CEToolbarItem: View, GenericExtension {
    var placement: CEToolbarItemPlacement { get }
}

extension CEToolbarItem {
    public var placement: CEToolbarItemPlacement { .automatic }
}
