import SwiftUI

struct ContentViewClients: View {
    
    @State var criteria : String = ""
    @StateObject var api = ViewModelClients()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Client name:").fontWeight(.bold)
            HStack {
                TextField("Client", text: $criteria)
                
                Button("Search") {
                    api.searchClient(criteria: criteria)
                }
            }
            
            List {
                ForEach(api.clients){ client in
                    ClientListView(name: client.name, phone: client.phone, email: client.email, status: client.status)
                }
            }
        }
        .padding(20)
    }
}
