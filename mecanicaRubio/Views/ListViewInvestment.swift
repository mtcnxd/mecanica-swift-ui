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
        HStack {
            Text(investmentItem.name)
                .font(.headline)
                .padding(5)
            Spacer()
            Text(investmentItem.current_amount)
                .font(.subheadline)
                .padding(5)
        }
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
