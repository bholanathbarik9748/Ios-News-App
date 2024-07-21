import SwiftUI

struct NewsCard: View {
    private let helper = Helper()
    let articleData: Articles
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: articleData.urlToImage ?? "")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 150)
                        .clipped()
                        .cornerRadius(10)
                case .failure(_):
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 150)
                        .clipped()
                        .cornerRadius(10)
                case .empty:
                    ProgressView()
                        .frame(height: 150)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(articleData.title ?? " ")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2) // Ensures the text does not overflow
                
                HStack {
                    if let formattedTime = helper.convertTimestampToReadableDateAndTime(articleData.publishedAt ?? " ") {
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
    NewsCard(articleData: Articles(
        source: Source(id: "google-news", name: "Google News"),
        author: "Al Jazeera English",
        title: "Slow recovery after CrowdStrike update sparks global IT outage",
        description: "Description of the article",
        url: "https://news.google.com/rss/articles/...",
        urlToImage: "https://example.com/image.jpg",
        publishedAt: "2024-07-20T09:11:15Z",
        content: "Content of the article"
    ))
}
