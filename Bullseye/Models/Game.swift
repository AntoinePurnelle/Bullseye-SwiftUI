//
//  Game.swift
//  Bullseye
//
//  Created by Antoine Purnelle on 11/03/2022.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries = [LeaderboardEntry]()
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 300, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 400, date: Date()))
        }
    }
    
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
        
        addToLeaderboard(score: points)
    }
    
    mutating func addToLeaderboard(score: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
