import SwiftUI

struct ContentViewServiceModal: View {
    
    @State var clientDetails : ModelClientDetails
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Client Details")
                    .bold()
                    .font(.title2)
                    .padding(.bottom, 10)
                ){
                    HStack {
                        Text("Client:").bold()
                        Spacer()
                        Text(clientDetails.name)
                    }
                    
                    HStack {
                        Text("Email:").bold()
                        Spacer()
                        Text(clientDetails.email)
                    }
                    
                    HStack {
                        Text("Phone:").bold()
                        Spacer()
                        Text(clientDetails.phone)
                    }
                    
                    HStack {
                        Text("Street:").bold()
                        Spacer()
                        Text(clientDetails.street ?? "")
                    }
                    
                    HStack {
                        Text("Postcode").bold()
                        Spacer()
                        Text(clientDetails.postcode)
                    }
                }
                .padding(.bottom, 10)
                
                HStack {
                    Spacer()
                    Button("Close"){
                        dismiss()
                    }
                }
                .frame(alignment: .trailing)
                
            } // form

        } // main vstack
        .padding(30)
    }
}

#Preview {
    ContentViewServiceModal(
        clientDetails: ModelClientDetails(
            id: 1,
            name: "Marcos Tzuc Cen",
            email: "mtc.nxd@gmail.com",
            phone: "9991210261",
            postcode: "97173",
            street: "Esta es una prueba de calle",
            address: "",
            city: "Merida",
            state: "Yucatan",
            rfc: nil,
            comments: nil,
            status: "Activo",
            created_at: "")
    )
}
