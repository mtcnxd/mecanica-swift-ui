import SwiftUI

struct ListViewClient : View {
    
    let client : ModelClient
    
    @State var visible = false
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 43, height: 43)
                
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
                    // let info = try await Repository().getServices(id: String(client.id))
                    visible = true
                    // print(info.data)
                }
            }){
                Image(systemName: "info.circle")
            }
        }
        .padding(2)
        .sheet(isPresented: $visible){
            ContentViewServiceModal(car: "Nissan")
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
