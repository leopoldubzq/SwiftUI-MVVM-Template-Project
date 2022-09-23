import SwiftUI
import Kingfisher

struct ArticleDetailsView<ViewModel: ArticleDetails.ViewModel>: View {
    
    private let viewModel: ViewModel
    private let article: ArticleDto
    private let horizontalPadding: CGFloat = 16
    
    init(viewModel: ViewModel, article: ArticleDto) {
        self.viewModel = viewModel
        self.article = article
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                KFImage(article.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .frame(maxWidth: getMaxImageWidth())
                    .clipped()
                    .background(Color.gray)
                    .cornerRadius(12)
                
                Text(article.title)
                    .foregroundColor(.label)
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Article")
    }
    
    private func getMaxImageWidth() -> CGFloat {
        UIScreen.main.bounds.width - (2 * horizontalPadding)
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    
    static let viewFactory = ViewFactory(dependenciesFactory: DependenciesFactory())
    
    static let viewModel = ArticleDetailsViewModel(viewFactory: viewFactory)
    
    static let article = ArticleDto(title: "Test title",
                                    imageUrl: URL(string: "https://www.telegraph.co.uk/content/dam/politics/2022/09/23/TELEMMGLPICT000310312383_trans_NvBQzQNjv4BqNKqRESvbksstVAhHMOFtR4TPD5foJ9o3wuqP2tL5Yek.jpeg?impolicy=logo-overlay"))
    
    static var previews: some View {
        NavigationStack {
            ArticleDetailsView(viewModel: viewModel,
                               article: article)
        }
    }
}
