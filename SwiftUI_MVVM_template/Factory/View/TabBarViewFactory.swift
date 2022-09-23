import SwiftUI
import Foundation

final class TabViewFactory {
    
    // MARK: - FACTORIES
    private let dependenciesFactory: DependenciesFactoryProtocol
    private let viewFactory: ViewFactory
    
    // MARK: - VIEW MODELS
    private let homeViewModel: HomeViewModel
    private let profileViewModel: ProfileViewModel
    
    // MARK: - INITIALIZER
    
    init(dependenciesFactory: DependenciesFactoryProtocol, viewFactory: ViewFactory) {
        self.dependenciesFactory = dependenciesFactory
        self.viewFactory = viewFactory
        homeViewModel = HomeViewModel(topHeadlinesService: dependenciesFactory.topHeadlinesService,
                                      viewFactory: viewFactory)
        profileViewModel = ProfileViewModel(viewFactory: viewFactory)
    }
    
    // MARK: - TAB BAR VIEWS
    
    @ViewBuilder
    func makeHomeView() -> some View {
        HomeView(viewModel: homeViewModel)
            .tabItem { makeTabItem(tab: .home) }
            .tag(TabItem.home)
    }
    
    @ViewBuilder
    func makeProfileView() -> some View {
        ProfileView(viewModel: profileViewModel)
            .tabItem { makeTabItem(tab: .profile) }
            .tag(TabItem.profile)
    }
    
    // MARK: - PRIVATE METHODS
    @ViewBuilder
    private func makeTabItem(tab: TabItem) -> some View {
        Image(systemName: tab.imageName)
        Text(tab.title)
    }
}
