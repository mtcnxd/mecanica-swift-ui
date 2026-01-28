import SwiftUI

struct ContentViewClients: View
{
    @State var criteria : String = ""
    @StateObject var api = ViewModelClients()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Client name:").fontWeight(.bold)
            HStack {
                TextField("Client", text: $criteria)
                
                Button(action: {
                    api.searchClient(criteria: criteria)
                }) {
                    Image(systemName: "magnifyingglass")
                    Text("Buscar")
                }
            }
            
            List {
                ForEach(api.clients){ client in
                    ListViewRow(name: client.name, phone: client.phone, email: client.email, status: client.status)
                }
            }
        }
        .padding(20)
    }
}
