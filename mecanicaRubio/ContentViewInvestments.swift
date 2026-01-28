//
//  ContentViewInvestments.swift
//  mecanicaRubio
//
//  Created by mtcnxd on 27/01/26.
//

import SwiftUI

struct ContentViewInvestments: View {
    
    @State var selected = "Yo te presto"
    @State var balance = ""
    
    let options = ["Yo te presto","Doopla","GBM Trading"]
    
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack {
                Picker("", selection: $selected){
                    ForEach(options, id: \.self) { item in
                        Text(item)
                    }
                }.frame(width: 200)
                
                Button (action: {
                    print("You have selected: \(selected) option")
                }) {
                    Image(systemName: "square.and.arrow.down")
                    Text("Get")
                }
            }
            
            HStack {
                TextField("Balance", text: $balance)
                    .frame(width: 200)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    print("save")
                }){
                    Text("Update")
                }
            }
            
        }.padding(20)
    }
}

#Preview {
    ContentViewInvestments(selected: "Doopla")
}
