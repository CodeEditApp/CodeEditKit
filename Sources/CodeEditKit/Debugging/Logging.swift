//
//  File.swift
//  
//
//  Created by Wouter Hennen on 22/05/2023.
//

import Foundation

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    let formedString = items.map { String(describing: $0) }.joined(separator: separator)
    NSLog(formedString)
}
