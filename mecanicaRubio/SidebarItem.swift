//
//  SidebarItem.swift
//  mecanicaRubio
//
//  Created by mtcnxd on 27/01/26.
//

enum SidebarItem: String, CaseIterable, Identifiable {
    case dashboard
    case clients
    case settings

    var id: String { rawValue }

    var title: String {
        switch self {
        case .dashboard: return "Dashboard"
        case .clients: return "Clientes"
        case .settings: return "Configuración"
        }
    }

    var icon: String {
        switch self {
        case .dashboard: return "speedometer"
        case .clients: return "person.3"
        case .settings: return "gear"
        }
    }
}
