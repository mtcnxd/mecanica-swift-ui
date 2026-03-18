import Foundation
import Combine

class ViewModelInvestment : ObservableObject {
    
    @Published var investments = [Investment]()
    
    init(){
        print("Start class View Model Investment")
    }
    
    func getInvestments(){
        Task {
            let response = try await Repository().getInvestments()
            self.investments = response.data
        }
    }
    
    func loadInformation(){
        
    }
    
}
