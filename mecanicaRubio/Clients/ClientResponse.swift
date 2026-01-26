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

extension Client {
    static let testData = Client(
        id: 1,
        name: "Marcos Tzuc Cen",
        email: "mtc.nxd@gmail.com",
        phone: "9991210261",
        status : "Activo"
    )
}
