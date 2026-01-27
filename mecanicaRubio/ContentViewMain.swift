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
       
        /*
        VStack {
            HStack {
                TextField ("Buscar cliente por nombre", text: $name)
                Button(action: {
                    Task {
                        let info = await ClientViewModel().searchClient(criteria: name)
                        clients = info.data
                    }
                })
                {
                    Image(systemName: "magnifyingglass")
                    Text("Buscar")
                }
            }
            
            List (clients) { client in
                ClientListView(
                    name: client.name,
                    phone: client.phone,
                    email: client.email,
                    status: client.status
                )
            }
                
            HStack () {
                Button("Cliente to open content view") {
                    print("Button client info clicked!")
                    isOpen = true
                }
                
                Button("Click to open alert") {
                    print("Button services info clicked!")
                    isShow = true
                }
            }
        }
        .padding()
        .task {
            // TODO: Change method to init in viewController
            clients = await ClientViewModel().clients.data
        }
        .alert( isPresented: $isShow ){
            Alert(
                title: Text("Titulo de la alerta"),
                message: Text("Hola mundo"),
            )
        }
        .sheet(isPresented: $isOpen){
            ContentViewServices()
        }
         */
    }
}
