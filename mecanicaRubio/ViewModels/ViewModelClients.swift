import Foundation
import Combine

class ViewModelClients : ObservableObject {

    @Published var clients: ModelClients?
    @Published var isLoading: Bool = false
    
    private let repository: Repository
    
    init(repository: Repository = Repository()) {
        self.repository = repository
        
        print("Start class View Model Clients")
    }
        
    func getClients() async {
        isLoading = true
        print("Loading clients list")
        do {
            clients = try await repository.getClients()
        } catch {
            print (error)
        }
        isLoading = false
    }
    
    func getClientDetails(criteria : String) async {
        isLoading = true
        do {
            clients = try await repository.searchClient(criteria: criteria)
        } catch {
            print(error)
        }
        isLoading = false
    }
}
