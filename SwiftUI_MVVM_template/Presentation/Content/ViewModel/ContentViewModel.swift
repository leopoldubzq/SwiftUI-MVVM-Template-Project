import SwiftUI
import Foundation

protocol ContentViewModelProtocol: ObservableObject {
    var selectedTab: TabItem { get set }
    associatedtype HomeView: View
    func makeHomeView() -> HomeView
    associatedtype ProfileView: View
    func makeProfileView() -> ProfileView
}

final class ContentViewModel: ContentViewModelProtocol {
    
    private let tabBarFactory: TabViewFactory
    
    @Published var selectedTab: TabItem = .home
    
    init(tabBarFactory: TabViewFactory) {
        self.tabBarFactory = tabBarFactory
    }
    
    // MARK: - TAB BAR VIEWS
    
    func makeHomeView() -> some View {
        tabBarFactory.makeHomeView()
    }
    
    func makeProfileView() -> some View {
        tabBarFactory.makeProfileView()
    }
}
