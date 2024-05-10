//
//  GridStack.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 10/05/2024.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows, columns : Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}
