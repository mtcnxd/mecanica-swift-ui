import Foundation

struct ModelClients : Codable {
    let success : Bool
    let data : [ModelClient]
}

struct ModelClient : Codable, Identifiable {
    let id : Int
    let name : String
    let email : String
    let phone : String
}

struct ModelClientResponse : Codable {
    let success: Bool
    let data : ModelClientDetails
}

struct ModelClientDetails: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let phone: String
    let postcode: String
    let street: String?
    let address: String
    let city: String
    let state: String
    let rfc: String?
    let comments: String?
    let status: String
    let created_at: String?
}
