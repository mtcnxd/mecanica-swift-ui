import Foundation
import Combine

class ViewModelClients : ObservableObject {

    @Published var clients = [Client]()
    
    init() {
        self.getClients()
    }
        
    func getClients() {
        Task {
            let response = try await Repository().getClients()
            self.clients = response.data
        }
    }
    
    func searchClient(criteria : String){
        Task {
            let response = try await Repository().searchClient(criteria: criteria)
            self.clients = response.data
        }
    }
}
