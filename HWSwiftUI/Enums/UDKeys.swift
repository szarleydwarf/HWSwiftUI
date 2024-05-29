//
//  UDKeys.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 29/05/2024.
//

import Foundation

enum UDKeys: String {
    case udExpense = "expenses"
}

enum ExpenseType: String, CaseIterable, Identifiable, Codable {
    case personal = "personal"
    case business = "business"
    
    var id: String {self.rawValue}
}
