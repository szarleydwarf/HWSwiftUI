//
//  AddExpenseView.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 29/05/2024.
//

import SwiftUI

struct AddExpenseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = "Tap to change name"
    @State private var type = ExpenseType.personal
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type: ", selection: $type) {
                    ForEach(ExpenseType.allCases) {expense in
                        Text(expense.rawValue)
                            .tag(expense)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "GBP"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .toolbar{
                Button("Save", systemImage: "square.and.arrow.down") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    
                    dismiss()
                }
            }

        }
    }
}

#Preview {
    AddExpenseView(expenses: Expenses())
}
