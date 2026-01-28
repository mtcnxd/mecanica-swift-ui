//
//  ContentViewServiceDetails.swift
//  mecanicaRubio
//
//  Created by mtcnxd on 27/01/26.
//

import SwiftUI

struct ContentViewServiceModal: View {
    @State var car : String
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Detalles de servicio")
                    .bold()
                ){
                    TextField("Car:", text: $car).padding(2).foregroundColor(Color.gray)
                    TextField("Fault:", text: $car).padding(2)
                    TextField("Started:", text: $car).padding(2)
                    TextField("Finished:", text: $car).padding(2)
                    TextField("Status:", text: $car).padding(2)
                    TextField("Total:", text: $car).padding(2)
                }
                
                Button("Cerrar"){
                    
                }
            }
        }
        .padding(40)
    }
}

#Preview {
    ContentViewServiceModal(car: "Nissan Versa")
}
