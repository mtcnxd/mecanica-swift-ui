import Foundation
import Combine

class ViewModelInvestment : ObservableObject {
    
    @Published var investments = [Investment]()
    @Published var investmentsItems = [InvestmentItem]()
    
    init(){
        print("Start class View Model Investment")
        self.getCryptoInvestments()
    }
    
    func getInvestments(){
        Task {
            let response = try await Repository().getInvestments()
            self.investments = response.data
        }
    }
    
    func getCryptoInvestments(){
        Task {
            let response = try await Repository().getCryptoInvestments()
            
            print(response)
            
            self.investmentsItems = response.items
        }
    }
}
