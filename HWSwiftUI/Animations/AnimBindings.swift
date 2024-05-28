//
//  AnimBindings.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 28/05/2024.
//

import SwiftUI

struct AnimBindings: View {
    @State private var firstAnimAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper(
                "Scale amount",
                value: $firstAnimAmount.animation(
                    .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)),
                in: 1...10)
            Spacer()
            Button("Tap") {
                firstAnimAmount += 1
            }
            .padding(30)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(firstAnimAmount)
            
            Spacer()
        }
    }
}

#Preview {
    AnimBindings()
}
