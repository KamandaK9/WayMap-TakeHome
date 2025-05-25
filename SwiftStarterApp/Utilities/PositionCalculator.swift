import Foundation

// This is a template for the PositionCalculator
// Candidates should implement this utility to calculate position based on steps and heading
// as per the assignment requirements

protocol PositionCalculatorProtocol {
    // Define methods for position calculation
    func calculateNewPosition(currentPosition: Position, steps: Int, heading: Double) -> Position
}

class PositionCalculator: PositionCalculatorProtocol {
    // MARK: - Properties
    
    /// The length of a single step in meters
    let stepLength: Double = Constants.Motion.defaultStepLength
    
    // MARK: - Initialization
    
    // MARK: - Public Methods
    
    /// Calculates a new position based on the current position, steps taken, and heading direction
    /// - Parameters:
    ///   - currentPosition: The current (x,y) position
    ///   - steps: Number of steps taken
    ///   - heading: The heading in degrees (0-360)
    /// - Returns: The new position
    func calculateNewPosition(currentPosition: Position, steps: Int, heading: Double) -> Position {
        // TODO: Implement the position calculation using the formula:
        // x += stepLength * cos(headingRadians)
        // y += stepLength * sin(headingRadians)
        let totalStepDistance = Double(steps) * stepLength
        let rightSideAmount = totalStepDistance * cos(degreesToRadians(heading))
        let upSideAmount = totalStepDistance * sin(degreesToRadians(heading))
        let newXPosition = currentPosition.x + rightSideAmount
        let newYPosition = currentPosition.y + upSideAmount
        
        return Position(x: newXPosition, y: newYPosition)
    }
    
    // MARK: - Private Methods
    
    /// Converts degrees to radians
    /// - Parameter degrees: The angle in degrees
    /// - Returns: The angle in radians
    private func degreesToRadians(_ degrees: Double) -> Double {
        let calculation = degrees * Double.pi / 180.0
        return calculation
    }
} 
