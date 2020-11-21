//
//  LaunchKeyChain.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/17/20.
//

import UIKit

class LaunchKeyChain: KeyChain {

    let key = "LaunchKeyChainData"

    static var shared = LaunchKeyChain()

    func save(isLaunched: Bool) {
        _ = store(key, isLaunched)
    }

    func get() -> Bool? {
        return load(key)
    }
}
