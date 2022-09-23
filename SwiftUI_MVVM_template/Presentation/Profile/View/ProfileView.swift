import SwiftUI

struct ProfileView<ViewModel: Profile.ViewModel>: View {
    
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Test")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.label)
                        .fontWeight(.semibold)
                        .font(.title3)
                        .padding()
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("User profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static let viewFactory = ViewFactory(dependenciesFactory: DependenciesFactory())
    static let viewModel = ProfileViewModel(viewFactory: viewFactory)
    
    static var previews: some View {
        ProfileView(viewModel: viewModel)
    }
}
