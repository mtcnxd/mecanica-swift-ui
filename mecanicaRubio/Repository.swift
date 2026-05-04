import Foundation

protocol DataRepository
{
    // like contract    
}

extension DataRepository
{
    func getClients() async throws -> ModelClient {
        let url = URL(string: "https://mecanicarubio.com/api/clients/all")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(ModelClient.self, from: data)
    }
    
    func searchClient(criteria : String) async throws -> ModelClient {
        var params = URLComponents(string: "https://mecanicarubio.com/api/clients/search")!
        
        params.queryItems = [
            URLQueryItem(name: "name", value: criteria)
        ]
        
        guard let url = params.url else {
            fatalError("Error url malformed")
        }
        
        let(data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(ModelClient.self, from: data)
    }
    
    func getServices(id : String) async throws -> ModelService {
        let url = URL(string: "https://mecanicarubio.com/api/clients/services/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(ModelService.self, from: data)
    }
    
    func getInvestments() async throws -> ModelCrypto {
        let url = URL(string: "https://mecanicarubio.com/api/sensors/trades")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let jsonString = String(data: data, encoding: .utf8){
            print(jsonString)
        }
        
        return try JSONDecoder().decode(ModelCrypto.self, from: data);
    }
    
    func getCryptoInvestments() async throws -> ModelInvestment {
        let url = URL(string: "https://mecanicarubio.com/api/investments/total")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let jsonString = String(data: data, encoding: .utf8){
            print(jsonString)
        }
        
        return try JSONDecoder().decode(ModelInvestment.self, from: data)
    }
}

struct Repository : DataRepository
{

}
