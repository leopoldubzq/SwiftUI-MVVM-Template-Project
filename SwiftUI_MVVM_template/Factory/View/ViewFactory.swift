import SwiftUI
import Foundation

final class ViewFactory {
    
    // MARK: - DEPENDENCIES FACTORY
    
    private let dependenciesFactory: DependenciesFactoryProtocol
    
    // MARK: - INITIALIZER
    
    init(dependenciesFactory: DependenciesFactoryProtocol) {
        self.dependenciesFactory = dependenciesFactory
    }
    
    // MARK: - DESTINATION VIEWS
    
    @ViewBuilder
    func makeArticleDetailsVie(article: ArticleDto) -> some View {
        let viewModel = ArticleDetailsViewModel(viewFactory: self)
        ArticleDetailsView(viewModel: viewModel, article: article)
    }
}
