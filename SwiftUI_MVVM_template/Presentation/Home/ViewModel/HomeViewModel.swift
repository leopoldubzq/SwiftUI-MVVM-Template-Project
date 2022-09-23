import SwiftUI
import Foundation
import Combine

protocol HomeViewModelProtocol {
    var articles: [ArticleDto] { get set }
    func fetchArticles()
    associatedtype DetailsView: View
    func makeArticleDetailsView(article: ArticleDto) -> DetailsView
}

final class HomeViewModel: Home.ViewModel {
    
    @Published var articles: [ArticleDto] = []
    
    private let topHeadlinesService: Network.TopHeadlines
    private var cancellables = Set<AnyCancellable>()
    
    init(topHeadlinesService: Network.TopHeadlines, viewFactory: ViewFactory) {
        self.topHeadlinesService = topHeadlinesService
        super.init(viewFactory: viewFactory)
    }
    
    func fetchArticles() {
        if articles.isEmpty { state = .loading }
        
        topHeadlinesService.fetchArticles(apiRequest: TopHeadlinesRequest(), model: ArticleResultDto.self)
        .map { $0.articles }
        .map { $0.filter { $0.imageUrl != nil } }
            .sink { [weak self] _ in
                self?.state = .ended
            } receiveValue: { [weak self] articles in
                self?.articles = articles
            }.store(in: &cancellables)
    }
    
    // MARK: - DESTINATION VIEWS
    
    func makeArticleDetailsView(article: ArticleDto) -> some View {
        viewFactory.makeArticleDetailsVie(article: article)
    }
}
