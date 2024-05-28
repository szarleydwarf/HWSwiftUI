//
//  AnimStack.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 28/05/2024.
//

import SwiftUI

struct AnimStack: View {
    @State private var enabled =  false
    
    var body: some View {
        Button("Tap") {
            enabled.toggle()
        }
        .frame(width: 120, height: 120)
        .background(enabled ? .blue : .yellow)
        .animation(.default, value: enabled)
        .foregroundStyle(enabled ? .white : .blue)
        .clipShape(.rect(cornerRadius: enabled ? 20 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
    }
}

#Preview {
    AnimStack()
}
