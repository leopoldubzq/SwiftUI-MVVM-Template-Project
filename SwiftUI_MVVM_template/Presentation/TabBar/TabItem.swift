enum TabItem: Int, CaseIterable, Hashable {
    case home
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        }
    }
    
    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .profile:
            return "person"
        }
    }
}
