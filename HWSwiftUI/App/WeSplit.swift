//
//  WeSplit.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 07/05/2024.
//

import SwiftUI

struct WeSplit: View {
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var tipValue: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        
        return tipValue
    }
    
    var grandTotal: Double {
        return checkAmount + tipValue
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                        .toolbar{
                            Button("Done") {
                                amountIsFocused = !amountIsFocused
                            }
                        }
                    
                    Picker("Number of people", selection:  $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much tip you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("OR")
                        .font(.title2)
                    NavigationStack {
                        Picker("Set yourself", selection: $tipPercentage) {
                            ForEach(0..<101) {
                                Text($0, format: .percent)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                }
                
                Section("Total Per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                }
                .font(.title)
                
                Section("Details of Reciepe") {
                    HStack {
                        Text("Original amount:")
                        Spacer()
                        Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                    }
                    
                    HStack {
                        Text("Tip:")
                        Spacer()
                        Text(tipValue, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                    }
                    
                    HStack {
                        Text("Original amount plus tip:")
                        Spacer()
                        Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                    }
                }
            }
            .navigationTitle("We Split")
        }
    }

}

#Preview {
    WeSplit()
}
