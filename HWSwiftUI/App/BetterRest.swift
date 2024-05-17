//
//  BetterRest.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 10/05/2024.
//

import SwiftUI
import CoreML

struct BetterRest: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    @State private var recomendedBedtime = "22:00"
    
    let paddingValue = 40.0
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 6
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            PurpleHeadLine(text: "Your recomended bedtime is")
            Text("\(recomendedBedtime)")
                .modifier(Title())
            Form {
                Section("When you want to wake up?") {
                    DatePicker("Enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .foregroundColor(.purple)
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4.0...12.0, step: 0.25)
                        .padding([.trailing], paddingValue)
                        .foregroundColor(.primary)
                }
                .foregroundColor(.purple)
                
                Section( "Daily coffee intake") {

                    Picker("^[\(coffeeAmount) cup](inflect:true)", selection: $coffeeAmount) {
                        ForEach(0..<21) {
                            Text("\($0)")
                        }
                        .foregroundColor(.primary)
                    }
                    .pickerStyle(.menu)
                }
                .foregroundColor(.purple)
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: {
                    calculateBedtime(true)
                })
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
            .onChange(of: wakeUp) {
                calculateBedtime(false)
            }
            .onChange(of: sleepAmount) {
                calculateBedtime(false)
            }
            .onChange(of: coffeeAmount) {
                calculateBedtime(false)
            }
            
        }
    }
    
    func calculateBedtime(_ wasButtonPressed: Bool) {
        print("CALC: \(sleepAmount)-\(coffeeAmount)-\(wakeUp)")
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minutes = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minutes), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            recomendedBedtime = sleepTime.formatted(date: .omitted, time: .shortened)

            alertTitle = "Your ideal bedtime is..."
            alertMessage = recomendedBedtime
            
        } catch {
            print("MLM ERR: \(error.localizedDescription)")
            alertTitle = "Oh no! We got an error"
            alertMessage = "Sorry, there was a problem calculating your bedtime"
        }
        showingAlert = wasButtonPressed ? true : false
    }
}

#Preview {
    BetterRest()
}
