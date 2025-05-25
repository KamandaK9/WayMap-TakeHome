# Swift iOS Step Compass Assignment

This repository provides a starting point for the Step Compass assignment. It includes templates and basic structure for implementing a step-based compass using CoreMotion and SwiftUI.

## Assignment Overview

Build a "Step Compass" feature that:
- Tracks step counts using CMPedometer
- Monitors device heading using CMMotionManager or CLLocationManager
- Calculates position based on steps and heading
- Displays information in a polished SwiftUI interface

## Requirements

- Xcode 15.0+
- iOS 17.0+
- Swift 5.10+

## Getting Started

### Quick Setup

Run the provided setup script:

```bash
./setup.sh
```

This script will:
1. Check if you have Homebrew installed (and install it if needed)
2. Install XcodeGen if it's not already installed
3. Generate the Xcode project
4. Open the project in Xcode

### Manual Setup

If you prefer to set things up manually:

1. Install XcodeGen if you don't have it already:
   ```bash
   brew install xcodegen
   ```

2. Generate the Xcode project:
   ```bash
   xcodegen generate
   ```

3. Open the generated project:
   ```bash
   open SwiftStarterApp.xcodeproj
   ```

### Using the Makefile

For convenience, a Makefile is provided with common commands:

```bash
make setup            # Run the full setup script
make generate_project # Only generate the Xcode project
make open             # Open the Xcode project
make clean            # Clean derived data
make help             # Show available commands
```

## Project Structure

```
SwiftStarterApp/
├── App/
│   └── StepCompassApp.swift      # App entry point
├── Models/
│   └── Position.swift            # Basic position model
├── Views/
│   ├── ContentView.swift         # Template for main content view
│   └── Components/                
│       └── CompassView.swift     # Basic compass component template
├── ViewModels/
│   └── CompassViewModel.swift    # View model template
├── Services/
│   └── MotionService.swift       # Template for motion services
├── Utilities/
│   ├── Constants.swift           # App constants
│   └── PositionCalculator.swift  # Template for position calculations
└── Resources/
    ├── Assets.xcassets           # Images and colors
    └── Preview Content/          # Preview assets
```

## Your Task

Please refer to the **"Waymap iOS Developer: Take-Home Assignment.md"** document for the official assignment requirements. While this repository provides a minimal structure to help you get started, it's crucial to carefully follow the official assignment instructions to ensure your implementation meets all requirements.

This repository provides scaffolding to implement the Step Compass assignment. You'll need to:

### 1. Motion Service

Implement `MotionService.swift` to:
- Stream step counts using CMPedometer
- Stream heading data using CMMotionManager or CLLocationManager
- Use Swift concurrency (actors or async streams)

### 2. Position Calculator

Implement `PositionCalculator.swift` to:
- Calculate new positions based on steps and heading
- Use the provided formula: `x += stepLength * cos(headingRadians)` and `y += stepLength * sin(headingRadians)`
- Ensure calculations are testable

### 3. UI Components

Implement:
- Connect and enhance `ContentView.swift` to display real-time data
- Improve the basic `CompassView.swift` to create a proper compass visualization
- Add appropriate animations for smooth heading changes

### 4. ViewModel

Implement the CompassViewModel:
- Add appropriate @Published properties
- Implement position tracking and updating
- Connect motion services to update the view

### 5. Tests

Write tests in `PositionCalculatorTests.swift` to verify:
- Position calculation accuracy for different headings
- Edge cases and error handling

## Note for Candidates

This repository provides only the basic structure for your implementation. You are expected to:

1. Fill in all `TODO` items in the code
2. Implement the missing functionality in each component
3. Add proper Swift concurrency patterns
4. Create a polished UI with smooth animations
5. Write comprehensive tests

Don't just fill in the templates - feel free to enhance them, add new files, or restructure as needed to demonstrate your skills and understanding of iOS development.
