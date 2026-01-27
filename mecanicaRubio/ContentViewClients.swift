//
//  ContentViewClients.swift
//  mecanicaRubio
//
//  Created by mtcnxd on 27/01/26.
//

import SwiftUI

struct ContentViewClients: View {
    
    @State var criteria : String = ""
    @State var clientsResult = ViewModelClients()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Client name:").fontWeight(.bold)
            HStack {
                TextField("Client", text: $criteria)
                
                Button("Search") {
                    let list = clientsResult.getClients()
                    print(list)
                }
            }
            
            List {
                
            }
        }
        .padding(20)
    }
}
