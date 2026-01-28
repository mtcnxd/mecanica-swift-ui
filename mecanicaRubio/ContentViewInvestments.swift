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
    @State var visible = false
    
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
                    Image(systemName: "tray.and.arrow.down")
                    Text("Get")
                }
            }
            
            Spacer()
            
            HStack {
                TextField("Balance", text: $balance)
                    .frame(width: 200)
                    .background(Color.white .opacity(0.2))
                    .overlay(
                        RoundedRectangle(cornerRadius: 7).stroke(Color.gray)
                    )
                
                Button(action: {
                    visible = true
                    print("save")
                }){
                    Image(systemName: "square.and.arrow.down")
                    Text("Update")
                }
            }
            
        }
        .padding(20)
        .alert(isPresented: $visible) {
            Alert(
                title: Text("Message"),
                message: Text("We can't show your balance currently"),
                primaryButton: .default(Text("Accept")),
                secondaryButton: .default(Text("Close"))
            )
        }
    
    }
}

#Preview {
    ContentViewInvestments(selected: "Doopla")
}
