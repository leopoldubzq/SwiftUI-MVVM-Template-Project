import Foundation

struct ArticleResultDto: Codable {
    var articles: [ArticleDto]
    
    enum CodingKeys: String, CodingKey {
        case articles
    }
}

struct ArticleDto: Codable, Identifiable {
    let id = UUID()
    let title: String
    let imageUrl: URL?
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageUrl = "urlToImage"
    }
}
