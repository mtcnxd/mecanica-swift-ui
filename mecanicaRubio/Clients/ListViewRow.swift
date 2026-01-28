import SwiftUI

struct ListViewRow : View {
    
    let client : Client
    
    @State var visible = false
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                VStack (alignment: .leading) {
                    Text(client.name)
                        .font(.headline)
                    
                    Text(client.phone)
                        .font(.subheadline)
                    
                    Text(client.email)
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                }
            
            }
            
            Spacer()
            
            Button(action: {
                print("client id: \(client.id)")
                
                Task {
                    let info = try await Repository().getServices(id: String(client.id))
                    visible = true
                    print(info.data)
                }
            }){
                Image(systemName: "info.circle")
                Text("Services")
            }
        }
        .padding(2)
        .sheet(isPresented: $visible){
            ContentViewServiceModal(car: "Nissan")
        }
        
    }
}

#Preview {
    ListViewRow(
        client: Client(
            id: 1,
            name: "Marcos Tzuc Cen",
            email: "mtc.nxd@gmail.com",
            phone: "9991210261",
            status: "Active"
        )
    )
}
