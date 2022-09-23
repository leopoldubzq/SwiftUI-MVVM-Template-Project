import Foundation

class TopHeadlinesRequest: APIRequest {
    var url: URL {
        Environment.baseURL ?? URL(fileURLWithPath: "")
    }
    
    var method: RequestType {
        .get
    }
    
    var path: String {
        "/top-headlines"
    }
    
    var parameters: [String : Any]? {
        ["language" : "en"]
    }
}


