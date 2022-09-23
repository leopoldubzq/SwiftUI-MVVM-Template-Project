import Foundation
import SwiftUI

enum LoaderState {
    case loading, ended
}

class BaseViewModel: ObservableObject {
    @Published var state: LoaderState = .ended
    
    // MARK: - PRIVATE PROPERTIES
    
    let viewFactory: ViewFactory
    
    init(viewFactory: ViewFactory) {
        self.viewFactory = viewFactory
    }
}
