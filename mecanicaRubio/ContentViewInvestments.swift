import SwiftUI

struct ContentViewInvestments: View {
    
    @State var selected = "Yo te presto"
    @State var balance = ""
    @State var visible = false
    
    @StateObject var vmInvestments = ViewModelInvestment()
    @State var responseList: [InvestmentItem] = []
    
    let options = [
        "Yo te presto",
        "Doopla",
        "GBM Trading",
        "Stori Card"
    ]
    
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
                    Text("Show Selected")
                }
                
                Button(action: {
                    Task {
                        await vmInvestments.getInvestments()
                        responseList = vmInvestments.investments
                    }
                    
                }){
                    Image(systemName: "square.and.arrow.down")
                    Text("Get Balances")
                }

            }
            
            VStack {
                if (vmInvestments.isLoading){
                    ProgressView()
                } else if let error = vmInvestments.errorMessage {
                    Text(error)
                } else {
                    List {
                        ForEach(responseList) { item in
                            ListViewItem(investmentItem: item)
                        }
                    }
                }
            }
            .onChange(of: vmInvestments.errorMessage) {
                if vmInvestments.errorMessage != nil {
                    visible = true
                    print("Error message")
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
        .padding(20)
    }
}

#Preview {
    ContentViewInvestments(selected: "Doopla")
}
