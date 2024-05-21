//
//  GesturesAnimations.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 21/05/2024.
//

import SwiftUI

struct GesturesAnimations: View {
    let letters = Array("Hello SwiftUI!")
    
    @State private var dragAmount = CGSize.zero
    @State private var dragAmountLetters = CGSize.zero
    @State private var enabled = false
    @State private var isShowingRed = false
    @State private var isShowingYellow = false
    
    var body: some View {
        VStack {
            ZStack {
                LinearGradient(colors: [.red, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 350, height: 100)
                    .clipShape(.rect(cornerRadius: 10))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged{dragAmount = $0.translation}
                            .onEnded{_ in
                                withAnimation(.bouncy){dragAmount = .zero}}
                    )
                
                HStack(spacing: 0) {
                    ForEach(0..<letters.count, id: \.self) { num in
                        Text(String(letters[num]))
                            .padding(5)
                            .font(.title)
                        //                        .foregroundColor(enabled ? .yellow : .blue)
                            .background(enabled ? .blue : .yellow)
                            .offset(dragAmountLetters)
                            .animation(.linear.delay(Double(num)), value: dragAmountLetters)
                    }
                }
                .gesture(DragGesture()
                    .onChanged {dragAmountLetters = $0.translation}
                    .onEnded{ _ in
                        dragAmountLetters = .zero
                        enabled.toggle()
                    }
                )
            }
            
            VStack {
                Button("Tap") {
                    withAnimation {
                        isShowingRed.toggle()
                    }
                }
                
                if isShowingRed {
                    Rectangle()
                        .fill(.teal)
                        .frame(width: 200, height: 100)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
            
            ZStack {
                Rectangle()
                    .fill(.green)
                    .frame(width: 200, height: 200)
                
                if isShowingYellow {
                    Rectangle()
                        .fill(.yellow)
                        .frame(width: 200, height: 200)
                        .transition(.pivot)
                }
            }
            .onTapGesture {
                withAnimation {
                    isShowingYellow.toggle()
                }
            }
            
        }
    }
}

#Preview {
    GesturesAnimations()
}
