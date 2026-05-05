import Foundation
import Combine

class ViewModelInvestment : ObservableObject {
    
    @Published var investments : [InvestmentItem] = []
    @Published var investmentsItems : [Investment] = []
    @Published var errorMessage : String?
    @Published var isLoading: Bool = false
    
    private let repository : Repository
    
    init(repository: Repository = Repository()){
        self.repository = repository
        print("Start class View Model Investment")
    }
    
    func getInvestments() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await repository.getInvestments()
            self.investments = response.items
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func getCryptoInvestments() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await repository.getCryptoInvestments()
            self.investmentsItems = response.data
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            print("Error: \(error.localizedDescription)")
        }
    }
}
