import SwiftUI

struct ListViewRow : View {
    let name : String
    let phone : String
    let email : String
    let status : String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                VStack (alignment: .leading) {
                    Text(name)
                        .font(.headline)
                    
                    Text(phone)
                        .font(.subheadline)
                    
                    Text(email)
                        .font(.subheadline)
                        .foregroundStyle(.blue)
                }
            
            }
            
            Spacer()
            
            Button(action: {
                print("Hola mundo")
            }){
                Image(systemName: "info.circle")
                Text(status)
            }
        }
        .padding(2)
    }
}

#Preview {
    ListViewRow(
        name: "Marcos Tzuc",
        phone: "Marcos Tzuc",
        email: "mtc.nxd@gmail.com",
        status : "Active"
    )
}
