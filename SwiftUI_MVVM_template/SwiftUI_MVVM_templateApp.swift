import SwiftUI

@main
struct SwiftUI_MVVM_templateApp: App {
    
    let dependenciesFactory = DependenciesFactory()
    private let viewFactory: ViewFactory
    private let tabViewFactory: TabViewFactory
    
    init() {
        viewFactory = ViewFactory(dependenciesFactory: dependenciesFactory)
        tabViewFactory = TabViewFactory(dependenciesFactory: dependenciesFactory, viewFactory: viewFactory)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel(tabBarFactory: tabViewFactory))
        }
    }
}
