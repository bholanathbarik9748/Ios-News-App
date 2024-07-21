import Foundation

private var baseUrl = "https://newsapi.org/v2/"

class NewsServices: ObservableObject {
    let apiKey = ProcessInfo.processInfo.environment["API_KEY"]
    
    func getTopHeadNews() async throws -> NewsResponse {
        guard let apiKey = apiKey else {
            throw NewsServiceError.missingAPIKey
        }
        
        let endPoint = "\(baseUrl)top-headlines?country=in&apiKey=\(apiKey)"
        
        guard let url = URL(string: endPoint) else {
            throw NewsServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check for a valid HTTP response
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw NewsServiceError.invalidResponse(statusCode: httpResponse.statusCode)
        }
        
        do {
            let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            return newsResponse
        } catch {
            throw NewsServiceError.decodingError(error)
        }
    }
}

enum NewsServiceError: Error {
    case missingAPIKey
    case invalidURL
    case invalidResponse(statusCode: Int)
    case decodingError(Error)
    
    var localizedDescription: String {
        switch self {
        case .missingAPIKey:
            return "API Key is missing."
        case .invalidURL:
            return "The URL is invalid."
        case .invalidResponse(let statusCode):
            return "Received an invalid response: \(statusCode)"
        case .decodingError(let error):
            return "Decoding error: \(error.localizedDescription)"
        }
    }
}
