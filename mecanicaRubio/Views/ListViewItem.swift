//
//  ListViewItem.swift
//  mecanicaRubio
//
//  Created by Marcos Tzuc Cen on 04/05/26.
//

import SwiftUI

struct ListViewItem : View {
    
    let investmentItem : InvestmentItem
    
    var body: some View {
        HStack {
            Text(investmentItem.name).font(.headline)
            Text(investmentItem.current_amount).font(.subheadline)
        }
    }
}

#Preview {
    ListViewItem(
        investmentItem : InvestmentItem(
            id: 1,
            name: "Yo te Presto",
            last_amount: "25000",
            current_amount: "30000"
        )
    )
}
