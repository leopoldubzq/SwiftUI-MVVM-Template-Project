import Foundation

protocol APIRequest {
    var url: URL { get }
    var method: RequestType { get }
    var path: String { get }
    var parameters: [String : Any]? { get }
}

extension APIRequest {
    
    func request() -> URLRequest {
        guard var components = URLComponents(url: url.appendingPathComponent(path),
                                             resolvingAgainstBaseURL: true) else { fatalError("Unable to create URL components") }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
    
        switch method {
        case .get:
            if let parameters = parameters {
                components.queryItems = parameters.map {
                    URLQueryItem(name: String($0), value: "\($1)")
                }
            }
        case .post:
            if let parameters = parameters {
                let bodyData = try? JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = bodyData
            }
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(Environment.apiKey, forHTTPHeaderField: "X-Api-Key")
        request.url = components.url
        return request
    }
}


