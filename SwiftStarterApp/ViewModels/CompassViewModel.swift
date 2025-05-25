import Foundation
import Combine

class CompassViewModel: ObservableObject {
    // MARK: - Properties
    
    // TODO: Add appropriate published properties to update the UI
    // Candidates need to decide what properties to make @Published
    
    @Published var stepCount: Int = 0
    @Published var heading: Double = 0.0
    @Published var position: Position = Position(x: 0, y: 0)
    
    
    
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
    
    // MARK: - Public Methods
    
    /// Starts tracking motion data
    func startTracking() {
        // TODO: Implement start tracking logic
        motionService.startMotionTracking { [weak self] stepCount, heading in
            self?.stepCount = stepCount
            self?.heading = heading
        }
    }
    
    /// Stops tracking motion data
    func stopTracking() {
        // TODO: Implement stop tracking logic
    }
    
    /// Resets the current position to the origin
    func resetPosition() {
        // TODO: Implement reset position logic
    }
    
    // MARK: - Private Methods
    
    // TODO: Add appropriate private methods for data handling
} 
