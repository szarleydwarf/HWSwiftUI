//
//  CapsuleText.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 10/05/2024.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
//            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}
