//
//  ExpenseItem.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 29/05/2024.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double
}
