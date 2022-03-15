//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Antoine Purnelle on 11/03/2022.
//

import XCTest

class BullseyeTests: XCTestCase {
    
    private var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }
    
    override func tearDownWithError() throws {
        game = nil
    }
    
    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(for: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(for: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testScorePerfect() {
        let guess = game.target
        let score = game.points(for: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose() {
        let guess = game.target + 2
        let score = game.points(for: guess)
        XCTAssertEqual(score, 98 + 50)
    }
    
    func testScore100() {
        let guess = 100
        let score = game.points(for: guess)
        XCTAssertEqual(score, game.target)
    }
    
    func testNewRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testRestart() {
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }
}
