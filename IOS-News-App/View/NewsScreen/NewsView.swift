import SwiftUI

struct NewsView: View {
    @StateObject private var searchViewModel = SearchViewModel()
    @StateObject private var newsServices = NewsServices()
    @State private var articles : [Articles] = [];
    @State private var errorMessage: String?
    
    var body: some View {
        VStack{
            SearchBar()
                .environmentObject(searchViewModel)
            
            TopList()
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(Array(articles.enumerated()), id: \.offset) { index, article in
                    NewsCard(articleData: article)
                }
            }
            
            if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .onAppear {
            Task {
                do {
                    let topNewsResponse = try await newsServices.getTopHeadNews()
                    DispatchQueue.main.async {
                        articles = topNewsResponse.articles ?? [];
                    }
                } catch {
                    if let newsServiceError = error as? NewsServiceError {
                        errorMessage = newsServiceError.localizedDescription
                    } else {
                        errorMessage = error.localizedDescription
                    }
                }
            }
        }
    }
}

#Preview {
    NewsView()
}
