enum SidebarItem: String, CaseIterable, Identifiable {
    case clients
    case services
    case investments

    var id: String { rawValue }

    var title: String {
        switch self {
        case .clients: return "Clientes"
        case .services: return "Services"
        case .investments: return "Investments"
        }
    }

    var icon: String {
        switch self {
        case .clients: return "person"
        case .services: return "car"
        case .investments: return "chart.line.uptrend.xyaxis"
        }
    }
}
