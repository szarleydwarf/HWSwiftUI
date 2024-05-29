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
           
            switch expense.amount {
            case 0..<10:
                SmallAmount(amount: expense.amount)
            case 10..<100:
                MediumAmount(amount: expense.amount)
            case 100..<Double.infinity:
                LargeAmount(amount: expense.amount)
            default:
                SmallAmount(amount: expense.amount)
            }
        }
    }
}

struct SmallAmount: View {
    let amount: Double
    
    var body : some View {
        Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(2)
            .background(.green)
            .clipShape(.rect(cornerRadius: 15))
    }
}

struct MediumAmount: View {
    let amount: Double
    
    var body : some View {
        Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(4)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 15))
    }
}

struct LargeAmount: View {
    let amount: Double
    
    var body : some View {
        Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(6)
            .background(.red)
            .clipShape(.rect(cornerRadius: 15))
    }
}
