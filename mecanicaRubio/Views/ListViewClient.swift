import SwiftUI

struct ListViewClient : View {
    
    let client : ModelClient
    
    @StateObject private var vmClients = ViewModelClients()
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                
                VStack (alignment: .leading) {
                    Text(client.name)
                        .font(.subheadline)
                    
                    Text(client.phone)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            
            }
            
            Spacer()
            
            Button(action: {
                Task {
                    print(client.id)
                    await vmClients.getClientDetails(id: client.id)
                }
            }){
                Image(systemName: "info.circle")
            }
        }
        .padding(2)
        .sheet(item: $vmClients.clientDetails) { clientDetails in
            let _ = print(clientDetails)
            ContentViewServiceModal(clientDetails: clientDetails)
        }
    }
}

#Preview {
    ListViewClient(
        client: ModelClient(
            id: 1,
            name: "Marcos Tzuc Cen",
            email: "mtc.nxd@gmail.com",
            phone: "9991210261"
        )
    )
}
