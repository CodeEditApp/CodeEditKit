//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation

public enum Entitlement: CustomStringConvertible, Codable, CaseIterable {
    case workspace
    case currentfile

    public var description: String {
        switch self {
        case .workspace:
            return "Workspace"
        case .currentfile:
            return "Current File"
        }
    }
}
