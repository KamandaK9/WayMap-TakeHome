import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel = CompassViewModel()
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step Compass")
                .font(.largeTitle)
                .padding()
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Steps: \(viewModel.stepCount)")
                    .font(.title2)
                
                Text("Heading: \(viewModel.headingLabel)")
                    .font(.title2)
                
                Text("Position: (\(String(format: "%.1f", viewModel.currentPosition.x)) m, \(String(format: "%.1f", viewModel.currentPosition.y)) m)")
                    .font(.title2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(Constants.UI.cornerRadius)
            .padding(.horizontal)
            
            CompassView(heading: 0)
                .padding()
            
            Button("Reset Position") {
                viewModel.resetPosition()
            }
            .padding()
            .buttonStyle(.bordered)
            
            Spacer()
        }
        .padding()
        // TODO: Implement lifecycle methods to start/stop tracking
        .onAppear {
            viewModel.startTracking()
        }
        .onDisappear {
            viewModel.stopTracking()
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 
