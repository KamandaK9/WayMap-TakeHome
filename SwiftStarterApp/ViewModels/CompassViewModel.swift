import Foundation
import Combine

class CompassViewModel: ObservableObject {
    // MARK: - Properties
    
    // TODO: Add appropriate published properties to update the UI
    // Candidates need to decide what properties to make @Published
    
    @Published var stepCount: Int = 0
    @Published var heading: Double = 0.0
    @Published var currentPosition: Position = Position(x: 0, y: 0)
    @Published var headingLabel: String = "N"
    
    
    
    // TODO: Add properties for heading and position
    
    // MARK: - Private Properties
    
    // TODO: Add services and dependencies
    private let motionService: MotionService
    private let positionCalculator: PositionCalculator
    private var lastPositionUpdate: Int = 0
    
    // MARK: - Initialization
    
    init(motionService: MotionService, positionCalculator: PositionCalculator) {
        // TODO: Initialize services and setup bindings
        self.motionService = motionService
        self.positionCalculator = positionCalculator
        self.lastPositionUpdate = 0
        
    }
    
    convenience init() {
        self.init(motionService: MotionService(), positionCalculator: PositionCalculator())
    }
    
    // MARK: - Public Methods
    
    /// Starts tracking motion data
    func startTracking() {
        // TODO: Implement start tracking logic
        motionService.startMotionTracking(
            stepUpdate: { steps in
                DispatchQueue.main.async {
                    self.stepCount = steps
                    if steps - self.lastPositionUpdate >= 10 {
                        let newPosition = self.positionCalculator.calculateNewPosition(
                            currentPosition: self.currentPosition,
                            steps: 10,
                            heading: self.heading
                        )
                        self.currentPosition = newPosition
                        self.lastPositionUpdate = steps
                    }
                }
            },
            headingUpdate: { heading in
                DispatchQueue.main.async {
                    self.heading = heading
                    self.headingLabel = self.updateHeading(heading)
                }
            }
        )
    }
    
    /// Stops tracking motion data
    func stopTracking() {
        // TODO: Implement stop tracking logic
        motionService.stopMotionTracking()
    }
    
    /// Resets the current position to the origin
    func resetPosition() {
        // TODO: Implement reset position logic
        currentPosition = Position.origin
        lastPositionUpdate = stepCount
        
    }
    
    // MARK: - Private Methods
    
    // TODO: Add appropriate private methods for data handling
    
    private func updateHeading(_ degrees: Double) -> String {
        let direction = convertToCompassDirection(degrees)
        return String(format: "%@ %0.1f°", direction, degrees)
    }
    
    private func convertToCompassDirection(_ degrees: Double) -> String {
        switch degrees {
        case 0...22, 338...360:
            return "N"
        case 23...67:
            return "NE"
        case 68...112:
            return "E"
        case 113...157:
            return "SE"
        case 158...202:
            return "S"
        case 203...247:
            return "SW"
        case 248...292:
            return "W"
        case 293...337:
            return "NW"
        default:
            return "N"
        }
    }
}
