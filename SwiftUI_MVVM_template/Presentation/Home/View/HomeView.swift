import SwiftUI
import Kingfisher

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
                        HStack(alignment: .top) {
                            VStack {
                                KFImage(model.imageUrl)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(12)
                                    .padding(.top, 10)
                                Spacer()
                            }
                            Text(model.title)
                                .padding(.top, 7)
                        }
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
