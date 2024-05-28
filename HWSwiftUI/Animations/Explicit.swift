//
//  Explicit.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 28/05/2024.
//

import SwiftUI

struct Explicit: View {
    @State private var firstAnimAmount = 1.0
    
    var body: some View {
        Button("Tap") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                firstAnimAmount += 360
            }
        }
        .padding(30)
        .background(.yellow)
        .foregroundStyle(.blue)
        .clipShape(.circle)
        .rotation3DEffect(
            .degrees(firstAnimAmount),
          axis: (x: 0.0, y: 1.0, z: 0.0)
        
        )
    }
}

#Preview {
    Explicit()
}
