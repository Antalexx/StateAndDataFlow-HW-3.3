//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexander Antonenko on 03.08.2021.
//

import Combine

final class UserManager: ObservableObject {

    @Published var isRegistered = false
    var name = ""
    
    init() {}
    
    init(name :String) {
        self.name = name
    }
    
}
