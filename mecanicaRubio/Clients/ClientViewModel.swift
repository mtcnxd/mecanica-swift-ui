import Foundation

class ClientViewModel
{
    var clients : ClientResponse
    
    init () async {
        self.clients = ClientResponse(success: false, data: [])
        clients = await loadClients()
    }
    
    final func loadClients() async -> ClientResponse {
        do {
            return try await Repository().getClients()
        }
        
        catch {
            print(error)
            return ClientResponse(success: false, data: [])
        }
    }
    
    final func searchClient(criteria : String) async -> ClientResponse {
        do {
            return try await Repository().searchClient(criteria: criteria)
        }
        
        catch {
            print(error)
            return ClientResponse(success: false, data: [])
        }
    }
}
