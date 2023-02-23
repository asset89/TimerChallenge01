//
//  TimerChallenge01Tests.swift
//  TimerChallenge01Tests
//
//  Created by Asset Ryskul on 23.02.2023.
//

import XCTest
@testable import TimerChallenge01

final class TimerChallenge01Tests: XCTestCase {
    
    var sut: ViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testCounterInitialIsZero() {
        XCTAssertEqual(sut.counter, 0)
    }
    
    func testTimerIsValid() {
        XCTAssertNotNil(sut.timer.isValid)
    }
    
    func testUpdateTimer() {
        sut.updateTimer()
        XCTAssertEqual(sut.counter, 0.1)
    }
    
    func testTimerStarted() {
        let expectation = self.expectation(description: "Timer")
        let expectedTime: Float = 2
        sut.timerStarted()
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(expectedTime)) { [self] in
            expectation.fulfill()
            
        }
        waitForExpectations(timeout: Double(expectedTime) + 1)
        XCTAssertEqual(Int(sut.counter), Int(expectedTime))
    
    }
    
    func testTimerStopped() {
        sut.timerStopped()
        XCTAssertFalse(sut.timer.isValid)
    }
    
    func testReset() {
        sut.reset()
        XCTAssertEqual(sut.counter, 0)
        XCTAssertFalse(sut.timer.isValid)

    }

}
