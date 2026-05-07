import Foundation
import Combine

class ViewModelServices : ObservableObject {
    
    @Published var services: ModelServices?
    @Published var serviceDetails: ModelService?
    @Published var isLoading: Bool = false
    
    private let repository: Repository
    
    init(repository: Repository = Repository()){
        self.repository = repository
    }
    
    func getServices() async {
        isLoading = true
        
        do {
            services = try await repository.getServices()
        } catch {
            print(error)
        }
        
        isLoading = false
    }
    
    func getServiceDetails(id: String) async {
        isLoading = true
        
        do {
            serviceDetails = try await repository.getServiceDetails(id: id)
        } catch {
            print(error)
        }
        
        isLoading = false
    }
    
}
