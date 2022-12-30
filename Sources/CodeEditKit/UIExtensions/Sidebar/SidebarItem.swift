//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SwiftUI

public protocol SidebarItem: View, Identifiable where ID == String {
    var id: ID { get }
    var icon: String { get }
}
