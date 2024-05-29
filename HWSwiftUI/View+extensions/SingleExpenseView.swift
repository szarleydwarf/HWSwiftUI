//
//  SingleExpenseView.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 29/05/2024.
//

import SwiftUI

struct SingleExpenseView: View {
    let expense: ExpenseItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(expense.name)
                PurpleHeadLine(text: expense.type.rawValue)
            }
            Spacer()
            Text(expense.amount, format: .currency(code: "GBP"))
        }
    }
}
