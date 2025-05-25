import SwiftUI

struct CompassView: View {
    // MARK: - Properties
    
    /// The current heading in degrees (0-360)
    var heading: Double
    
    // MARK: - Body
    
    var body: some View {
        // TODO: Implement a compass view that rotates according to the heading
        // This is a basic placeholder that candidates should replace with a proper compass
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 200, height: 200)
            
            // Basic placeholder arrow
            Rectangle()
                .fill(Color.red)
                .frame(width: 2, height: 80)
                .offset(y: -40)
                // Note: This doesn't animate smoothly - candidates need to implement proper animation
                .rotationEffect(.degrees(-heading))
            
            Text("N")
                .offset(y: -110)
        }
        .frame(width: 200, height: 200)
    }
}

// MARK: - Preview

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView(heading: 45)
            .previewLayout(.sizeThatFits)
            .padding()
    }
} 