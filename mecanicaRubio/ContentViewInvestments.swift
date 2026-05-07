import SwiftUI

struct ContentViewInvestments: View {
    
    @StateObject var vmInvestments = ViewModelInvestment()
    
    @State var selected = "Yo te presto"
    @State var visible = false
    @State var balance = ""
    
    let options = [
        "Yo te presto",
        "Doopla",
        "GBM Trading",
        "Stori Card"
    ]
    
    var body: some View {
        VStack {
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
                    Text("Show Selected")
                }
                
                Button(action: {
                    Task {
                        await vmInvestments.getInvestments()
                    }
                    
                }){
                    Image(systemName: "square.and.arrow.down")
                    Text("Get Balances")
                }
            }
            
            if (vmInvestments.isLoading){
                ZStack {
                    ProgressView("Loading investments ...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
            } else if let error = vmInvestments.errorMessage {
                Spacer()
                Text(error)
            } else {
                VStack {
                    List {
                        ForEach(vmInvestments.investments) { item in
                            ListViewInvestment(investmentItem: item)
                        }
                    }
                }
                .onChange(of: vmInvestments.errorMessage) {
                    if vmInvestments.errorMessage != nil {
                        visible = true
                    }
                }
                .alert(isPresented: $visible) {
                    Alert(
                        title: Text("Error retriving data"),
                        message: Text(vmInvestments.errorMessage!),
                        primaryButton: .default(Text("Accept")),
                        secondaryButton: .default(Text("Close"))
                    )
                }
            }
        }
        .padding(10)
    }
}

#Preview {
    ContentViewInvestments(selected: "Doopla")
}
