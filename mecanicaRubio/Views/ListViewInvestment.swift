//
//  ListViewItem.swift
//  mecanicaRubio
//
//  Created by Marcos Tzuc Cen on 04/05/26.
//

import SwiftUI

struct ListViewInvestment : View {
    
    let investmentItem : InvestmentItem
        
    var body: some View {
        VStack {
            HStack {
                Text(investmentItem.name)
                    .font(.headline)
                    .padding(5)
                Spacer()
                Text(formatToCurrency(value: investmentItem.current_amount), format: .currency(code: "MXN"))
                    .font(.headline)
                    .padding(.horizontal, 5)
            }
            
            HStack {
                Spacer()
                Text(formatToCurrency(value: investmentItem.last_amount), format: .currency(code: "MXN"))
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.trailing, 5)
            }
        }
    }
    
    func formatToCurrency(value: String) -> Double {
        return Double(value)!
    }
}

#Preview {
    ListViewInvestment(
        investmentItem : InvestmentItem(
            id: 1,
            name: "Yo te Presto",
            last_amount: "25000",
            current_amount: "30000"
        )
    )
}
