import SwiftUI

struct ContentViewMain: View
{
    @State private var selection: SidebarItem? = .clients
    
    var body: some View {
        NavigationSplitView {
            List(SidebarItem.allCases, selection: $selection) { item in
                Button (action: {
                    selection = item
                }){
                    Label(item.title, systemImage: item.icon)
                }
                .padding(4)
                
            }
            .listStyle(.sidebar)
                
        } detail: {
               switch selection {
                   case .clients:
                       ContentViewClients()
                   case .services:
                       ContentViewServices()
                   case .investments:
                       ContentViewInvestments()
                   case nil:
                       Text("Selecciona una opción")
               }
           }
           .frame(minWidth: 700, minHeight: 400)
    }
}

#Preview {
    ContentViewMain()
}
