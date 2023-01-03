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
    func getExtensionKinds(reply: @escaping XPCReply)

    func getTheme(reply: @escaping XPCReply)

    func doAction(with identifier: String, reply: @escaping XPCReply)
}


class XPCWrapper: XPCWrappable {

    var ext: any CodeEditExtension

    init(_ ext: any CodeEditExtension) {
        self.ext = ext
    }

    func getExtensionKinds(reply: @escaping XPCReply) {
        do {
            let encoded = try JSONEncoder().encode(ext.gatherAvailableExtensions())
            reply(encoded, nil)
        } catch {
            reply(nil, error)
        }
    }

    func getTheme(reply: @escaping XPCReply) {
        guard let ext = ext as? any ThemeExtension else {
            reply(nil, XPCError.extensionDoesNotExist(description: String(describing: (any ThemeExtension).self)))
            return
        }
        let id = "XcodeLightTheme"
        guard let theme = ext.getTheme(with: id) else {
            reply(nil, XPCError.identifierDoesNotExist(description: id))
            return
        }
        do {
            let encoded = try JSONEncoder().encode(theme)
            reply(encoded, nil)
        } catch {
            reply(nil, error)
        }
    }

    func doAction(with identifier: String, reply: @escaping XPCReply) {

    }
}
