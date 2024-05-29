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
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        if item.type == .personal {
                            SingleExpenseView(expense: item)
                        }
                    }
                    .onDelete(perform: removeItem)
                }
                Section("Business") {
                    ForEach(expenses.items) { item in
                    
                        if item.type == .business {
                            SingleExpenseView(expense: item)
                        }
                    }
                    .onDelete(perform: removeItem)
                }
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
