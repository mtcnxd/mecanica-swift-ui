import SwiftUI

struct MyApp : App {
    var body : some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View
{
    @State private var clients : [Client] = []
    @State private var name : String = ""
    @State private var isShow : Bool = false
    
    var body: some View {
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
                Button("Cliente Info") {
                    print("Button client info clicked!")
                }
                
                Button("Click to open alert") {
                    print("Button services info clicked!")
                    isShow = true
                }
            }
        }
        .padding()
        .task {
            clients = await ClientViewModel().clients.data
        }
        .alert( isPresented: $isShow ){
            Alert(
                title: Text("Titulo de la alerta"),
                message: Text("Hola mundo"),
            )
        }
    }
}

#Preview {
    ContentView()
}
