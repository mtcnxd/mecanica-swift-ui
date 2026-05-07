import SwiftUI

struct ContentViewServices: View {
    
    @StateObject var vmServices : ViewModelServices = ViewModelServices()
        
    var body: some View {
        VStack {
            if vmServices.isLoading {
                ZStack {
                    ProgressView("Loading services ...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } else {
                if let services = vmServices.services {
                    List {
                        ForEach(services.data) { service in
                            ListViewService(service: service)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
            }
        }
        .task {
            await vmServices.getServices()
        }
    }
}

#Preview {
    ContentViewServices()
}
