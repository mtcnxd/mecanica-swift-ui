import Foundation

struct ModelService : Codable {
    let success: Bool
    let data : [Service]
}

struct Service : Codable, Identifiable {
    let id: Int
    let car : String
    let fault : String
    let started : String
    let finished : String
    let status : String
    let total : String
}
