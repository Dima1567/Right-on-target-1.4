//
//  GameRound.swift
//  1. Right on target
//
//  Created by Dima Savitskiy on 12.10.21.
//

import Foundation

protocol GameRoundProtocol {
    var score: Int {get}
    var currentSecretValue: Int { get }
    func calculateScore(with value: Int)
}

class GameRound: GameRoundProtocol {
    var score: Int = 0
    var currentSecretValue: Int = 0
    init (secretValue: Int) {
        currentSecretValue = secretValue
    }
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}
