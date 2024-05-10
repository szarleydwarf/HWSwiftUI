//
//  Title.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 10/05/2024.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.teal)
            .clipShape(.rect(cornerRadius: 15))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
