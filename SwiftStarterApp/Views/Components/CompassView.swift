import SwiftUI

struct CompassView: View {
    // MARK: - Properties
    
    /// The current heading in degrees (0-360)
    var heading: Double
    
    // MARK: - Body
    
    var body: some View {
        // TODO: Implement a compass view that rotates according to the heading
        ZStack {
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 8
                )
                .frame(width: 200, height: 200)
            
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.white, Color.gray.opacity(0.1)],
                        center: .center,
                        startRadius: 5,
                        endRadius: 100
                    )
                )
                .frame(width: 180, height: 180)
            
            ForEach(0..<4) { index in
                Rectangle()
                    .fill(Color.gray.opacity(0.6))
                    .frame(width: 2, height: 20)
                    .offset(y: -85)
                    .rotationEffect(.degrees(Double(index) * 90))
            }
            
            directionLabels()
            needle()
        }
    }
    
    @ViewBuilder
    private func directionLabels() -> some View {
        VStack {
            Text("N")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(Constants.UI.Colors.primary)
                .offset(y: -110)
            
            HStack {
                Text("W")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.gray)
                    .offset(x: -20)
                
                Spacer()
                
                Text("E")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.gray)
                    .offset(x: 20)
            }
            .frame(width: 220)
            
            Text("S")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(Constants.UI.Colors.primary)
                .offset(y: 110)
        }
    }
    
    @ViewBuilder
    private func needle() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.black.opacity(0.2))
                .frame(width: 6, height: 80)
                .offset(x: 2, y: -38)
            
            RoundedRectangle(cornerRadius: 2)
                .fill(Constants.UI.Colors.accent)
                .frame(width: 4, height: 80)
                .offset(y: -40)
            
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color.white, Color.gray.opacity(0.3)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 8, height: 8)
                .offset(y: 5)
        }
        .rotationEffect(.degrees(-heading))
        .animation(Constants.UI.Animation.compass, value: heading)
        
        Circle()
            .fill(
                RadialGradient(
                    colors: [Color.white, Color.gray],
                    center: .center,
                    startRadius: 1,
                    endRadius: 8
                )
            )
            .frame(width: 16, height: 16)
            .overlay(
                Circle()
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
        
    }
}

// MARK: - Preview

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView(heading: 45)
            .previewLayout(.sizeThatFits)
            .padding()
        
        CompassView(heading: 90)
            .previewLayout(.sizeThatFits)
            .padding()
    }
} 
