//
//  Generator.swift
//  1. Right on target
//
//  Created by Dima Savitskiy on 12.10.21.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}

class Generator: GeneratorProtocol {
    private let startRangeValue: Int
    private let endRangeValue: Int
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else {
            return nil
        }
        startRangeValue = startValue
        endRangeValue = endValue
        }
    func getRandomValue() -> Int {
        (startRangeValue...endRangeValue).randomElement()!
    }
}
