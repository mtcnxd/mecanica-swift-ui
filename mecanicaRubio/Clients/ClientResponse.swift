import Foundation

struct ClientResponse : Codable {
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
