import Foundation
import Combine

class ViewModelInvestment : ObservableObject {
    
    @Published var investments = [Investment]()
    
    init(){
        print("Start class View Model Investment")
        self.getInvestments()
    }
    
    func getInvestments(){
        Task {
            let response = try await Repository().getInvestments()
            print("Okas: ")
            print(response.data)
            self.investments = response.data
        }
    }
}
