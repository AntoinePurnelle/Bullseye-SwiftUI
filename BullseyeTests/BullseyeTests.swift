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
        XCTAssertEqual(score, 100)
    }
    
    func testScore100() {
        let guess = 100
        let score = game.points(for: guess)
        XCTAssertEqual(score, game.target)
    }
}
