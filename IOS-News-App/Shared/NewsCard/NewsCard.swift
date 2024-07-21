import SwiftUI

struct NewsCard: View {
    private let helper = Helper()
    
    let imgUrl = "https://media.wired.com/photos/6672c421e0704c563b4e7b77/191:100/w_1280,c_limit/GettyImages-80973767.jpg"
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: imgUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
                    .frame(height: 150)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("This Ancient Technology Is Helping Millions Stay Cool")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2) // Ensures the text does not overflow
                
                HStack {
                    if let formattedTime = helper.convertTimestampToReadableDateAndTime("2024-07-09T15:42:42Z") {
                        Text(formattedTime)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Save button action here
                        print("Article saved!")
                    }) {
                        HStack {
                            Image(systemName: "bookmark.fill")
                            Text("Save")
                                .font(.caption)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.blue.opacity(0.1))
                        .foregroundColor(.blue)
                        .cornerRadius(8)
                        .shadow(color: Color.blue.opacity(0.2), radius: 2, x: 0, y: 2) // Subtle shadow effect
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(10) // Rounded corners for the content
        }
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 10, x: 0, y: 5) // Larger shadow for a more elevated look
        .padding(.horizontal)
    }
}

#Preview {
    NewsCard()
}
