//
//  ServicesContentView.swift
//  mecanicaRubio
//
//  Created by mtcnxd on 27/01/26.
//

import SwiftUI

struct ContentViewServices: View {
    
    var services: [ModelService] = [
        ModelService(
            id: 1,
            service_type: "Fallo",
            fault: "Fallo en el motor, no arranca",
            status: "Activo",
            entry_date: "2025-05-03",
            finished_date: "2025-05-01",
            total: "100"
        ),
        ModelService(
            id: 2,
            service_type: "Mantenimiento",
            fault: "Se lo cargo el payaso",
            status: "Finalizado",
            entry_date: "2025-05-03",
            finished_date: "2025-05-01",
            total: "100"
        )
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(services) { service in
                    ListViewService(service: service)
                        .listRowSeparator(.hidden)
                }
            }
        }
    }
}

#Preview {
    ContentViewServices(
        services: [
            ModelService(
                id: 1,
                service_type: "Fallo",
                fault: "Fallo en el motor, no arranca",
                status: "Activo",
                entry_date: "2025-05-03",
                finished_date: "2025-05-01",
                total: "100"
            ),
            ModelService(
                id: 1,
                service_type: "Fallo",
                fault: "Fallo en el motor, no arranca",
                status: "Activo",
                entry_date: "2025-05-03",
                finished_date: "2025-05-01",
                total: "100"
            )
        ]
    )
}
