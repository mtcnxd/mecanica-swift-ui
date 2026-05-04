import Foundation

struct InvestmentClient : Codable {
    let total : String
    let items : [Items]
}

struct Items : Codable, Identifiable {
    let id : Int
    let name : String
    let last_amount : String
    let current_amount : String
}
