import Foundation

struct ModelCrypto : Codable {
    let current_total : Double
    let purchase_total : Double
    let data : [Investment]
}

struct Investment : Codable, Identifiable {
    let id : Int
    let book : String
    let amount : String
    let price : String
    let purchase_value : Double
    let current_value : Double
    let updated_at : Date
    let created_at : Date
}
	
