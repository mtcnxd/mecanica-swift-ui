import Foundation

protocol DataRepository
{
    // like contract    
}

extension DataRepository
{
    func getClients() async throws -> ModelClients {
        let url = URL(string: "https://mecanicarubio.com/api/clients")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(ModelClients.self, from: data)
    }
    
    func searchClient(criteria : String) async throws -> ModelClients {
        var params = URLComponents(string: "https://mecanicarubio.com/api/clients")!
                
        params.queryItems = [
            URLQueryItem(name: "name", value: criteria)
        ]
        
        guard let url = params.url else {
            fatalError("Error url malformed")
        }
        
        let(response, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(ModelClients.self, from: response)
    }
    
    func getServices(id : String) async throws -> ModelServices {
        let url = URL(string: "https://mecanicarubio.com/api/services")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(ModelServices.self, from: data)
    }
    
    func getServiceDetails() async throws {
        let url = URL(string: "https://mecanicarubio.com/api/clients/services")!
        let (response, _) = try await URLSession.shared.data(from: url)
        let ModelServiceResponse = try JSONDecoder().decode(ModelService.self, from: response)
        
        print(ModelServiceResponse)
    }
    
    func getCryptoInvestments() async throws -> ModelCrypto {
        let url = URL(string: "https://mecanicarubio.com/api/sensors/trades")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let jsonString = String(data: data, encoding: .utf8){
            print(jsonString)
        }
        
        return try JSONDecoder().decode(ModelCrypto.self, from: data);
    }
    
    func getInvestments() async throws -> ModelInvestment {
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
