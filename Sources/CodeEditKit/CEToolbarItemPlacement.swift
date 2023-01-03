//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import SwiftUI

public enum CEToolbarItemPlacement: Codable {
    case automatic
    case principal

    public var toolbarItemPlacement: ToolbarItemPlacement {
        switch self {
        case .automatic:
            return .automatic
        case .principal:
            return .principal
        }
    }
}
