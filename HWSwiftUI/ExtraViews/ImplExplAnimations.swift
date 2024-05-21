//
//  ImplExplAnimations.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 21/05/2024.
//

import SwiftUI

struct ImplExplAnimations: View {
    @State private var animationAmount = 1.0
    @State private var animationCircle = 1.0
    @State private var animationRotation = 0.0
    @State private var animationShape = 0.0
    @State private var enabled = false
    
    var body: some View {
        VStack {
            Stepper("Scale amount",
                    value: $animationAmount.animation(
                        .easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true)),
                    in: 1...10)
        }
        
        Spacer()
        
        Button("1") {
            animationAmount += 0.25
        }
        .padding(30)
        .background(.teal)
        .foregroundColor(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        //        .animation(.easeInOut(duration: 1).repeatCount(3, autoreverses: true), value: animationAmount)
        //        .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
        
        Spacer()
        
        HStack {
            Button("2") {
            }
            .padding(30)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.green)
                    .scaleEffect(animationCircle)
                    .opacity(2 - animationCircle)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationCircle
                    )
            )
            .onAppear {
                animationCircle = 2
            }
            
            Button("3") {
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    animationRotation += 360
                }
            }
            .padding(30)
            .background(.yellow)
            .foregroundColor(.blue)
            .clipShape(.circle)
            .rotation3DEffect(
                .degrees(animationRotation),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            
            Button("4") {
                enabled.toggle()
            }
            .frame(width: 50, height: 50)
            .background(enabled ? .yellow : .blue)
            .foregroundColor(enabled ? .blue : .yellow)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.easeInOut(duration: 1), value: enabled)
            
            Button("5") {
              enabled.toggle()
            }
            .frame(width: 50, height: 50)
            .background(enabled ? .blue : .red)
            .animation(.default, value: enabled)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
            
            Button("6") {
              enabled.toggle()
            }
            .frame(width: 50, height: 50)
            .background(enabled ? .blue : .red)
            .animation(nil, value: enabled)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
        }
        Spacer()
    }
}

#Preview {
    ImplExplAnimations()
}
