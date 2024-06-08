//
//  HorizonatLine.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 04/06/2024.
//

import SwiftUI

struct HorizonatLine: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    HorizonatLine()
}
