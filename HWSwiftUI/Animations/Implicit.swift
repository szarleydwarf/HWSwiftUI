//
//  Implicit.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 28/05/2024.
//

import SwiftUI

struct Implicit: View {
    @State private var firstAnimAmount = 1.0
    @State private var secondAnimAmmount = 1.0
    var body: some View {
        VStack {
            Spacer()
            Button("Tap") {
                firstAnimAmount += 1
            }
            .padding(30)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(firstAnimAmount)
    //        .animation(.default, value: firstAnimAmount)
    //        .animation(.linear, value: firstAnimAmount)
    //        .animation(.spring(duration: 1, bounce:  0.9), value: firstAnimAmount)
    //        .animation(.easeInOut(duration: 2).delay(1), value: firstAnimAmount)
            .animation(.easeInOut(duration: 2).repeatCount(3, autoreverses: true), value: firstAnimAmount)
            .blur(radius: (firstAnimAmount - 1) * 3)
            
            Spacer()
            
            Button("Tap") {}
            .padding(30)
            .background(.teal)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.green)
                    .scaleEffect(secondAnimAmmount)
                    .opacity(2 - secondAnimAmmount)
                    .animation(
                        .easeIn(duration: 1)
                        .repeatForever(autoreverses: true),
                        value: secondAnimAmmount)
            )
            .onAppear {
                secondAnimAmmount = 2
            }
            
            Spacer()
        }
    }
}

#Preview {
    Implicit()
}
