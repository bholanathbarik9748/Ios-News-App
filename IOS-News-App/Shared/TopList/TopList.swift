import SwiftUI

struct TopList: View {
    let newsTopic = [
        "India",
        "World",
        "Business",
        "Technology",
        "Entertainment",
        "Sports",
        "Science",
        "Health"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(newsTopic, id: \.self) { topic in
                    Button(action: {
                        print(topic)
                    }) {
                        Text(topic)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color("Primary"))
                            .foregroundColor(Color("Secondary"))
                            .cornerRadius(10)
                            .font(.headline)
                            .bold()
                            .shadow(radius: 2)
                            .scaleEffect(1.0, anchor: .center)
                            .animation(.easeInOut(duration: 0.2), value: topic) // Animation for button press effect
                    }
                    .buttonStyle(PlainButtonStyle()) // Prevents default button style changes
                }
            }
        }
        .frame(height: 50) // Ensure a consistent height for the scroll view
        .padding(.horizontal)
    }
}

#Preview {
    TopList()
}
