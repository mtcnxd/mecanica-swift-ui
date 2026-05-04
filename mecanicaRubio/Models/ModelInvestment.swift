import Foundation

struct ModelInvestment : Codable {
    let total : String
    let items : [InvestmentItem]
}

struct InvestmentItem : Codable, Identifiable {
    let id : Int
    let name : String
    let last_amount : String
    let current_amount : String
}
