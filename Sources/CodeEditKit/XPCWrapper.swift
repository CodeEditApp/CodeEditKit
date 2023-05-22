//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation

public typealias XPCReply = (Data?, Error?) -> Void

public enum XPCError: Error {
    case extensionDoesNotExist(description: String)
    case identifierDoesNotExist(description: String)
}

@objc
public protocol XPCWrappable {
    func getExtensionURL(reply: @escaping XPCReply)

    func getExtensionKinds(reply: @escaping XPCReply)

    func getExtensionProcessIdentifier(reply: @escaping (Int32) -> Void)

    func doAction(with identifier: String, reply: @escaping XPCReply)
}


class XPCWrapper: XPCWrappable {

    var ext: any CodeEditExtension

    init(_ ext: any CodeEditExtension) {
        self.ext = ext
    }

    func getExtensionURL(reply: @escaping XPCReply) {
        do {
            let encoded = try JSONEncoder().encode(ext.extensionURL)
            reply(encoded, nil)
        } catch {
            reply(nil, error)
        }
    }

    func getExtensionKinds(reply: @escaping XPCReply) {
        do {
            let encoded = try JSONEncoder().encode(ext.gatherAvailableExtensions())
            reply(encoded, nil)
        } catch {
            reply(nil, error)
        }
    }

    func getExtensionProcessIdentifier(reply: @escaping (Int32) -> Void) {
        reply(ProcessInfo.processInfo.processIdentifier)
    }

    func doAction(with identifier: String, reply: @escaping XPCReply) {

    }
}
