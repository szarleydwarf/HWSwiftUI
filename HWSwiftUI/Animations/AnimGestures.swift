//
//  AnimGestures.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 28/05/2024.
//

import SwiftUI

struct AnimGestures: View {
    private let letters = Array("Hello SwiftUI!")
    
    @State private var enabled = false
    @State private var letterDragAmount = CGSize.zero
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 330, height: 200)
                .clipShape(.rect(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged {dragAmount = $0.translation }
                        .onEnded{_ in
                            withAnimation(.bouncy) {
                                dragAmount = .zero
                            }
                        }
                )
            //            .animation(.bouncy, value: dragAmount)
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) {num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .yellow)
                        .offset(letterDragAmount)
                        .animation(.linear.delay(Double(num) / 20), value: letterDragAmount)
                }
            }
            .gesture(DragGesture()
                .onChanged{letterDragAmount = $0.translation}
                .onEnded{ _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
            )
        }
    }
}

#Preview {
    AnimGestures()
}
