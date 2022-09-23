import Foundation

protocol DependenciesFactoryProtocol {
    var topHeadlinesService: Network.TopHeadlines { get }
}

final class DependenciesFactory: DependenciesFactoryProtocol {
    
    let topHeadlinesService: Network.TopHeadlines
    
    init() {
        topHeadlinesService = TopHeadlinesService()
    }
}

