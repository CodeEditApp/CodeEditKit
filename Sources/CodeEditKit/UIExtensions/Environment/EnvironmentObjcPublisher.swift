//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation

@objc public protocol EnvironmentPublisherObjc {
    func publishEnvironment(data: Data)
}


public class EnvironmentPublisher: ObservableObject, EnvironmentPublisherObjc {

    @Published var environment = _CEEnvironment()

    public init() {}

    public func publishEnvironment(@Decoded<_CEEnvironment> data: Data) {
        guard let $data else { return }
        environment = $data
        print("update: received data \($data)")
    }
}
