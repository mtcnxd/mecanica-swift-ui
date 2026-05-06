import Foundation

struct ModelServices : Codable {
    let success: Bool
    let data : [ModelService]
}

struct ModelService : Codable, Identifiable {
    let id: Int
    let service_type: String
    let fault : String
    let status : String
    let entry_date: String
    let finished_date : String
    let total : String
}
