//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Alexander Antonenko on 03.08.2021.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    var body: some Scene {
        WindowGroup {
            StarterView().environmentObject(UserManager())

        }
    }
}
