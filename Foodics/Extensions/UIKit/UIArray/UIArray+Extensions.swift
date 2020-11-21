//
//  UIArray+Extensions.swift
//  Foodics
//
//  Created by MhMuD SalAh on 11/18/20.
//

import Foundation

extension Array {
    func takeElements(elementCount: Int) -> Array {
        if (elementCount > count) {
            return Array(self[0..<count])
        }
        return Array(self[0..<elementCount])
    }
}
