import XCTest
@testable import SwiftStarterApp

final class PositionCalculatorTests: XCTestCase {
    // MARK: - Properties
    private let startPos = Position.origin
    private let stepLength = Constants.Motion.defaultStepLength
    private let stepInterval = Constants.Motion.positionUpdateStepInterval

    var positionCalculator: PositionCalculator!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        positionCalculator = PositionCalculator()
    }
    
    override func tearDown() {
        positionCalculator = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    // TODO: Implement tests for different heading scenarios
    // Test the position calculation for at least three different headings
    
    func testWalkNorth() {
        let result = positionCalculator.calculateNewPosition(
            currentPosition: startPos,
            steps: stepInterval,
            heading: 0
        )
        
        XCTAssertEqual(result.x, 0, "X shouldn't change if walking North")
        XCTAssertEqual(result.y, stepLength, "Y Should increase by 10 steps")
    }
    
    func testPositionCalculation() {
        // TODO: Implement position calculation tests
              let northResult = positionCalculator.calculateNewPosition(
                  currentPosition: startPos,
                  steps: stepInterval,
                  heading: 0.0
              )
              
              XCTAssertEqual(northResult.x, 0.0, "X shouldn't change if walking North")
        XCTAssertEqual(northResult.y, stepLength, "Walking North 10 steps should move 7.5m in Y direction")
              
              let eastResult = positionCalculator.calculateNewPosition(
                  currentPosition: startPos,
                  steps: stepInterval,
                  heading: 90.0
              )
              
              XCTAssertEqual(eastResult.x, stepLength, "Walking East 10 steps should move 7.5m in X direction")
              XCTAssertEqual(eastResult.y, 0.0, "Walking East should not change Y coordinate")
              
              let southwestResult = positionCalculator.calculateNewPosition(
                  currentPosition: startPos,
                  steps: stepInterval,
                  heading: 225.0
              )
    }
    
    // TODO: Add tests for edge cases
    func testEdgeCases() {
        let zeroStepsResult = positionCalculator.calculateNewPosition(
            currentPosition: startPos,
            steps: 0,
            heading: 45.0
        )
        
        XCTAssertEqual(zeroStepsResult.x, 0.0, "Zero steps should not change position")
        XCTAssertEqual(zeroStepsResult.y, 0.0, "Zero steps should not change position")
    }
}
