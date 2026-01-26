import Foundation

protocol DataRepository
{
    // like contract    
}

extension DataRepository
{
    func getClients() async throws -> ClientResponse {
        let url = URL(string: "https://mecanicarubio.com/api/clients/all")!
        let (data, _) = try await URLSession.shared.data(from: url)

        return try JSONDecoder().decode(ClientResponse.self, from: data)
    }
    
    func searchClient(criteria : String) async throws -> ClientResponse {
        var params = URLComponents(string: "https://mecanicarubio.com/api/clients/search")!
        
        params.queryItems = [
            URLQueryItem(name: "name", value: criteria)
        ]
        
        guard let url = params.url else {
            fatalError("Error url malformed")
        }
        
        let(data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(ClientResponse.self, from: data)
    }
}

struct Repository : DataRepository
{

}
