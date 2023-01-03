//
//  File.swift
//  
//
//  Created by Wouter Hennen on 30/12/2022.
//

import Foundation
import SwiftUI

struct GeneralSettingsView<Content: View>: View {

    @StateObject var environmentWrapper: EnvironmentPublisher
    @ViewBuilder var content: Content

    var body: some View {
        content
            .environment(\._ceEnvironment, environmentWrapper.environment)
    }
}
