//
//  WTFColor.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 10/05/2024.
//

import SwiftUI

struct WTFColor: ViewModifier {
    var trueOrFalse: Bool
    
    func body(content: Content) -> some View {
        content
            .font(trueOrFalse ? .largeTitle : .body)
            .foregroundColor(trueOrFalse ? .red : .primary)
    }
}

extension View {
    func redOrPrime(trueOrFalse: Bool) -> some View {
        modifier(WTFColor(trueOrFalse: trueOrFalse))
    }
}
