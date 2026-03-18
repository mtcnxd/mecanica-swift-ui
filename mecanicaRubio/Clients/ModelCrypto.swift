import Foundation

struct ModelCrypto : Codable {
    let current_total : Float
    let purchase_total : Float
    let data : [Investment]
}

struct Investment : Codable, Identifiable {
    let id : Int
    let book : String
    let amount : String
    let price : String
    let purchase_value : Float
    let current_value : Float
    let updated_at : Date
    let created_at : Date
}
	
