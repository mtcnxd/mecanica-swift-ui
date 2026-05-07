//  ListViewItem.swift
//  mecanicaRubio
//
//  Created by Marcos Tzuc Cen on 04/05/26.
//

import SwiftUI

struct ListViewService : View {
    
    let service : ModelService
    
    var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                
                HStack {
                    Text("#\(service.id)")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(service.status)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(statusColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Text(service.service_type)
                    .font(.headline)
                
                Text(service.fault)
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Entrada")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text(service.entry_date ?? "")
                            .font(.caption2)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Salida")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text(service.finished_date ?? "")
                            .font(.caption2)
                    }
                }
                
                HStack {
                    Spacer()
                    Text("$\(service.total)")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(.white))
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
            )
            .padding(5)
        }
    
    var statusColor: Color {
        switch service.status.lowercased() {
        case "activo":
            return .blue
        case "finalizado":
            return .green
        case "pendiente":
            return .orange
        default:
            return .gray
        }
    }
}

#Preview {
    ListViewService(
        service : ModelService(
            id: 1,
            service_type: "Fallo",
            fault: "Fallo en el motor, no arranca",
            status: "Activo",
            entry_date: "2025-05-03",
            finished_date: "2025-05-01",
            total: 100
        )
    )
}
