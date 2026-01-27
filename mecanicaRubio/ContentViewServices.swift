//
//  ServicesContentView.swift
//  mecanicaRubio
//
//  Created by mtcnxd on 27/01/26.
//

import SwiftUI

struct ContentViewServices: View {
    var body: some View {
        @State var username : String = ""
        
        VStack {
            HStack {
                Text("Username:")
                Spacer()
                TextField("Username", text: $username)
            }
            
            HStack {
                Text("Password:")
                Spacer()
                TextField("Password", text: $username)
            }
            
            Button("Login"){
                print("Ok")
            }
        }
        .padding(50)
    }
}
