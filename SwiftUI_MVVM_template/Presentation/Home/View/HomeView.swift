import SwiftUI

struct HomeView<ViewModel: Home.ViewModel>: View {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(viewModel.articles, id: \.id) { model in
                    NavigationLink {
                        viewModel.makeArticleDetailsView(article: model)
                    } label: {
                        Text(model.title)
                    }
                }
                .listStyle(.plain)
                
                .navigationTitle("Home screen")
                
                if viewModel.state == .loading { Spinner() }
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .onAppear { viewModel.fetchArticles() }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory(dependenciesFactory: DependenciesFactory())
    static let viewModel = HomeViewModel(topHeadlinesService: TopHeadlinesService(),
                                         viewFactory: viewFactory)
    
    static var previews: some View {
        HomeView(viewModel: viewModel)
    }
}
