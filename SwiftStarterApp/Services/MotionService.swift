import Foundation
import CoreMotion
import CoreLocation

// This is a template for the MotionService
// Candidates should implement this service to handle motion data
// as per the assignment requirements

protocol MotionServiceProtocol {
    // Add methods to get step count and heading data
    // These should return async streams or use a callback mechanism
    var stepCount: Int { get }
    var heading: Double { get }
    
    var stepStream: AsyncStream<Int> { get }
    var headingStream: AsyncStream<Double> { get }
    
    func startMotionTracking(
        stepUpdate: @escaping (Int) -> Void,
        headingUpdate: @escaping (Double) -> Void
    ) 
    
    func stopMotionTracking()
    
}

// Example implementation outline
class MotionService: NSObject, MotionServiceProtocol, ObservableObject, CLLocationManagerDelegate {
   
    // MARK: - Properties
    @Published private(set) var stepCount: Int = 0
    @Published private(set) var heading: Double = 0.0
    
    private var headingUpdateCallback: ((Double) -> Void)?

    let pedometer = CMPedometer()
    let locationManager = CLLocationManager()
    
    var stepStream: AsyncStream<Int> {
        AsyncStream { _ in }
    }
    
    var headingStream: AsyncStream<Double> {
        AsyncStream { _ in }
    }
    
    func startMotionTracking(stepUpdate: @escaping (Int) -> Void, headingUpdate: @escaping (Double) -> Void) {
        headingUpdateCallback = headingUpdate
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date()) { data, error in
                guard let data = data else { return }
                let steps = data.numberOfSteps.intValue
                
                DispatchQueue.main.async {
                    self.stepCount = steps
                    stepUpdate(steps)
                }
            }
            
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingHeading()
        } else {
            print("Step Count not available")
        }
        
    }
    
    func stopMotionTracking() {
        stopUpdates()
    }
    

    // MARK: - Initialization
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    // MARK: - Public Methods
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let headingValue = newHeading.magneticHeading
        
        DispatchQueue.main.async {
            self.heading = headingValue
            self.headingUpdateCallback?(headingValue)
        }
    }
    
    // MARK: - Private Methods
    private func stopUpdates() {
        locationManager.stopUpdatingLocation()
        locationManager.stopUpdatingHeading()
        pedometer.stopUpdates()
        headingUpdateCallback = nil
    }
}

// Example of how to create a mock for testing
class MockMotionService: MotionServiceProtocol, ObservableObject {
    @Published private(set) var stepCount: Int = 0
    @Published private(set) var heading: Double = 0.0
    
    private var stepCallback: ((Int) -> Void)?
    private var headingCallBack: ((Double) -> Void)?
    
        
    var stepStream: AsyncStream<Int> {
        AsyncStream { _ in }
    }
    
    var headingStream: AsyncStream<Double> {
        AsyncStream { _ in }
    }
    
    private var simulationTimer: Timer?
    
    func startMotionTracking(stepUpdate: @escaping (Int) -> Void, headingUpdate: @escaping (Double) -> Void) {
        // Implement Mockup Tracking
    }
    
    func stopMotionTracking() {
        // Implement Mockup Stop tracking
    }
    
    // MARK: - Mock Sim Methods
    private func startSimulation() {
        simulationTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.simulateStepsUpdate()
            self.simulateHeadingUpdate()
        }
    }
    
    private func simulateStepsUpdate() {
           stepCount += Int.random(in: 1...3)
           DispatchQueue.main.async {
               self.stepCallback?(self.stepCount)
           }
       }
       
       private func simulateHeadingUpdate() {
       }
    
}
