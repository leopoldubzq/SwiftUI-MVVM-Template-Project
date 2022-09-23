import SwiftUI

struct ContentView<ViewModel: ContentViewModelProtocol>: View {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            viewModel.makeHomeView()
            viewModel.makeProfileView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let dependenciesFactory = DependenciesFactory()
    static let viewFactory = ViewFactory(dependenciesFactory: dependenciesFactory)
    static let tabBarViewFactory = TabViewFactory(dependenciesFactory: dependenciesFactory, viewFactory: viewFactory)
    static let viewModel = ContentViewModel(tabBarFactory: tabBarViewFactory)
    
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
