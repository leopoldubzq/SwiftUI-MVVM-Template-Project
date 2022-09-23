import SwiftUI

struct Spinner: View {
    
    private let title: String
    
    init(_ title: String = "Loading") {
        self.title = title
    }
    
    var body: some View {
        ProgressView(title)
            .tint(.accentColor)
            .padding()
            .background(Color.gray.opacity(0.55))
            .cornerRadius(12)
    }
}

struct Spinner_Previews: PreviewProvider {
    static var previews: some View {
        Spinner("Loading...")
    }
}
