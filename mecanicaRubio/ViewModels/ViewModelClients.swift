import Foundation
import Combine

class ViewModelClients : ObservableObject {

    @Published var isLoading: Bool = false
    @Published var clients: ModelClients?
    @Published var clientDetails: ModelClientDetails?
    
    private let repository: Repository
    
    init(repository: Repository = Repository()) {
        self.repository = repository
    }
        
    func getClients() async {
        isLoading = true

        do {
            clients = try await repository.getClients()
        } catch {
            print (error)
        }
        
        isLoading = false
    }
    
    func getClientResults(criteria : String) async {
        isLoading = true
        
        do {
            clients = try await repository.getClientsResults(criteria: criteria)
        } catch {
            print(error)
        }
        
        isLoading = false
    }
    
    func getClientDetails(id : Int) async {
        isLoading = true

        do {
            let response = try await repository.getClientDetails(id: id)
            clientDetails = response.data
        } catch {
            print(error)
        }

        isLoading = false
    }
}
