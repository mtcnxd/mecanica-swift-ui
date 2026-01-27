import Foundation

@Observable
final class ViewModelClients {
    
    var names : [String]
    // var response : ClientResponse
    
    init() {
        self.names = ["marcos", "juan"]
        
        let hola = self.getClients()
        
        print(hola)
        
        // self.names = names
        // self.response = response
        
        print(self.names)
    }
    
    func getClients() -> ClientResponse {
        let datos = Client(id: 1, name: "Marcos Tzuc", email: "mtc.nxd@gmail.com", phone: "9991210261", status: "Active")
        
        return ClientResponse(success: true, data: [datos])
    }
}
