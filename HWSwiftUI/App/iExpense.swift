//
//  iExpense.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 28/05/2024.
//

import SwiftUI
import Observation

struct iExpense: View {
    @State private var expenses = Expenses()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItem)
            }
            .toolbar{
                Button("Add", systemImage: "plus") {
                    let expense = ExpenseItem(name: "Test", type: .personal, amount: 5.0)
                    expenses.items.append(expense)
                }
            }
        }
        .navigationTitle("Expenses")
    }
    
    func removeItem(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

#Preview {
    iExpense()
}
