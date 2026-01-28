import SwiftUI

struct ContentViewMain: View
{
    @State private var clients : [Client] = []
    @State private var name : String = ""
    @State private var isShow : Bool = false
    @State private var isOpen : Bool = false
    @State private var selection: SidebarItem? = .dashboard
    
    var body: some View {
        NavigationSplitView {
               List(SidebarItem.allCases, selection: $selection) { item in
                   Label(item.title, systemImage: item.icon)
               }
               .listStyle(.sidebar)
           } detail: {
               switch selection {
               case .dashboard:
                   ContentViewClients()
                   // Text("Dashboard")
               case .clients:
                   Text("Clientes")
               case .settings:
                   Text("Configuración")
               case nil:
                   Text("Selecciona una opción")
               }
           }
           .frame(minWidth: 700, minHeight: 400)
    }
}
