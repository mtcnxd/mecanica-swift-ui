import Foundation

struct ModelClient : Codable {
    let success : Bool
    let data : [Client]
}

struct Client : Codable, Identifiable {
    let id : Int
    let name : String
    let email : String
    let phone : String
    let status : String
}
