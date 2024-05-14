//
//  PurpleHeadLine.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 14/05/2024.
//

import SwiftUI

struct PurpleHeadLine: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundStyle(.purple)
    }
}
