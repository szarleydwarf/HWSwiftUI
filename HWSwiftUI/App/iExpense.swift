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
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    SingleExpenseView(expense: item)
                }
                .onDelete(perform: removeItem)
            }
            .toolbar{
                Button("Add", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .navigationTitle("iExpenses")
        }
        .sheet(isPresented: $showingAddExpense) {
            AddExpenseView(expenses: expenses)
        }
        
    }
    
    func removeItem(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
}

#Preview {
    iExpense()
}
