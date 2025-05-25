# Step Compass

This iOS app was designed following the Model-View-ViewModel (MVVM) architectural pattern, with a strong emphasis on real-time sensor integration. The app combines step counting with compass heading to calculate and visualize user movement in 2D space. It employs SwiftUI for the interface and integrates Core Motion and Core Location frameworks for precise motion tracking.

## Why MVVM?

In the case of this app, sensor integration benefits greatly from MVVM because the ViewModel acts as an intermediary between the View and the sensor services. This means that the View doesn't need to know about the complex sensor APIs or threading requirements. It only needs to know about the ViewModel, which provides it with clean, processed data. This makes the code more modular and easier to understand, test, and maintain.

The ViewModel coordinates between multiple services (MotionService for sensors, PositionCalculator for math) while the View focuses purely on presentation.

## Why Protocol-Oriented Design?

In my app, protocols are used extensively to enable dependency injection and testing. The MotionServiceProtocol allows me to swap between real sensor implementations and mock services for testing. This architectural choice made the code more flexible and testable, while maintaining clean separation of concerns throughout the application.

## Architecture

### File Organization
- **MotionService.swift**: Handles CMPedometer and CLLocationManager integration
- **PositionCalculator.swift**: Encapsulates trigonometric calculations  
- **CompassViewModel.swift**: Coordinates data flow and business logic
- **ContentView.swift**: Main SwiftUI interface
- **CompassView.swift**: Custom compass component

## Features

### Real-Time Step Tracking
The app uses CMPedometer to continuously monitor step count from the device's motion sensors. Each step is tracked in real-time and displayed to the user immediately.

### Live Compass Integration  
The app features live compass heading using CLLocationManager's magnetic heading capabilities. The compass needle rotates smoothly as the user changes direction, providing immediate visual feedback.

### Trigonometric Position Calculation
Every 10 steps, the app calculates a new position using trigonometric formulas based on the current heading direction. This creates a 2D coordinate system showing relative movement from the starting point.

### Custom Compass Visualization
A custom-built SwiftUI compass view provides an intuitive interface with smooth animations, cardinal direction markers, and a rotating needle that reflects real compass readings.

### Position Reset Functionality
Users can reset their position to the origin (0,0) at any time, allowing them to start fresh tracking from a new reference point.


## Installation

As this app relies solely on Apple's native frameworks (Core Motion, Core Location, SwiftUI), the installation process is straightforward. The app requires a physical iOS device as motion sensors are not available in the simulator.

### Requirements
- Xcode 15.0+
- iOS 17.0+
- Physical iOS device (motion sensors required)

### Setup Steps
1. Download the project and open it in Xcode
2. Select your physical device as the target
3. Build and run the project 
4. Grant motion and location permissions when prompted

## Technical Challenges & Solutions

### Challenge 1: Threading Complexity
**Issue**: Sensor callbacks occur on background threads, but SwiftUI updates must happen on the main thread.

**Solution**: Implemented proper `DispatchQueue.main.async` wrapping for all `@Published` property updates, ensuring thread-safe UI updates.

### Challenge 2: Coordinate System Mapping
**Issue**: SwiftUI's rotation coordinate system differs from standard compass coordinates, causing incorrect needle positioning.

**Solution**: Applied proper coordinate transformations and tested multiple rotation approaches to achieve accurate compass needle alignment.

### Challenge 3: Position Update Logic
**Issue**: Understanding when to trigger position updates relative to step counting proved complex.

**Solution**: Implemented step difference tracking rather than absolute counts, ensuring position updates occur precisely every 10 steps as specified.

## Key Design Decisions

### Sensor Integration Approach
I chose to focus on real sensor integration over extensive mocking, prioritizing authentic iOS development challenges and demonstrating practical sensor API usage.

### Callback vs. AsyncStream Architecture
I implemented traditional callback patterns for sensor data flow, providing immediate functionality while maintaining the flexibility to upgrade to AsyncStream patterns in future iterations.


## Next Steps (Given More Time)

### Immediate Enhancements
- **AsyncStream Integration**: Implement modern reactive patterns for sensor data streams
- **Async Functions**: Make use of more Async functions instead of relying on callback and closures.
- **Enhanced Error Handling**: Comprehensive sensor availability and permission management
- **Data Persistence**: Position saving/restoration using UserDefaults
- **Mock Service Completion**: Full testing infrastructure with simulated sensor data

### Advanced Features
- **HomeView Visualization**: Improve the *ContentView* file with more visualization and design elements
- **Export Functionality**: Share Steps and bearing information feature.
- **History Tab**: A history tab to show a user the steps they've taken and on which dates. 

## Lessons Learned

This project provided valuable educational material, in dealing with CMPedometer, CLLocationManager and Trigonometry calculations that I haven't had the opportunity to combine into one solution. I enjoyed extensive research and applying tutorials to come up with my personal problem-solve. Knowing that our phones provide so much sensory data to build such an application was fun! and has indeed piqued my curiosity to build more fun stuff in the future

---

*Thank you for the opportunity to work on this challenging and educational project. The integration of motion sensors, trigonometry, and modern iOS development patterns provided significant learning value. I hope to work on more of these soon!*

### Video DEMO
- https://drive.google.com/file/d/1ai1tb2ht3wyZVOQ4XFCdA0QIrXttjrCM/view?usp=sharing
