//
//  Game.swift
//  Bullseye
//
//  Created by Antoine Purnelle on 11/03/2022.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(for sliderValue: Int) -> Int {
        var points = 100 - abs(target - sliderValue)
        
        if points == 100 {
            points += 50
        }
        
        if points >= 98 {
            points += 50
        }
        
        
        return points
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
