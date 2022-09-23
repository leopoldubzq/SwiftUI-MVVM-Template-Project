import Foundation
import Combine

protocol TopHeadlinesServiceProtocol {
    func fetchArticles<T: Codable>(apiRequest: APIRequest, model: T.Type) -> AnyPublisher<T, Error>
}

final class TopHeadlinesService: Network.TopHeadlines {
    func fetchArticles<T: Codable>(apiRequest: APIRequest, model: T.Type) -> AnyPublisher<T, Error> {
        let request = apiRequest.request()
        return Future { promise in
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    promise(.failure(error))
                }
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let fetchedData = try decoder.decode(T.self, from: data)
                        DispatchQueue.main.async {
                            promise(.success(fetchedData))
                        }
                    } catch {
                        promise(.failure(error))
                    }
                }
            }.resume()
        }
        .eraseToAnyPublisher()
    }
}
