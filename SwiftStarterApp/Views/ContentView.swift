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
                Text("Steps: 0")
                    .font(.title2)
                
                Text("Heading: 0° N")
                    .font(.title2)
                
                Text("Position: (0.0 m, 0.0 m)")
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
                // Add reset functionality
            }
            .padding()
            .buttonStyle(.bordered)
            
            Spacer()
        }
        .padding()
        // TODO: Implement lifecycle methods to start/stop tracking
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 