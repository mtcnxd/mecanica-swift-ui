import SwiftUI

struct ContentViewClients: View
{
    @StateObject var vmClients = ViewModelClients()
    @State var criteria : String = ""
    @State var isLoading : Bool = false
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Client name:").fontWeight(.bold)
            HStack {
                TextField("Client", text: $criteria)
                
                Button(action: {
                    Task {
                        await vmClients.getClientResults(criteria: criteria)
                    }

                }) {
                    Image(systemName: "magnifyingglass")
                    Text("Buscar")
                }
            }
            
            if vmClients.isLoading {
                ZStack {
                    ProgressView("Loading clients ...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
            } else {
                if let clients = vmClients.clients {
                    List {
                        ForEach(clients.data){ client in
                            ListViewClient(client: client)
                                .listRowSeparator(.hidden) // Oculta la linea que divide los rows
                        }
                    }
                    .scrollContentBackground(.hidden) // Oculta el fondo predeterminado
                }
            }
        }
        .task {
            Task {
                await vmClients.getClients()
            }
        }
        .padding(20)
    }
}


#Preview {
    ContentViewClients(
        vmClients: ViewModelClients(),
        criteria: "uriel",
        isLoading: true
    )
}
