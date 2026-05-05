import Foundation
import Combine

class ViewModelInvestment : ObservableObject {
    
    @Published var investments = [Investment]()
    @Published var investmentsItems = [InvestmentItem]()
    
    private let repository : Repository
    
    init(repository: Repository = Repository()){
        self.repository = repository
        print("Start class View Model Investment")
    }
    
    func getInvestments() async {
        do {
            let response = try await repository.getInvestments()
            self.investments = response.data
        } catch {
            errorMessage = error.localizedDescription
            print("Error")
        }
    }
    
    func getCryptoInvestments() async {
        let response = try await repository.getCryptoInvestments()
        self.investmentsItems = response.items
    }
}
