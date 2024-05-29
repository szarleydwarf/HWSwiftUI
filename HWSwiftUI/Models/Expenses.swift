//
//  Expenses.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 29/05/2024.
//

import Foundation

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: UDKeys.udExpense.rawValue)
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: UDKeys.udExpense.rawValue) {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
