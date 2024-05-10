//
//  ViewsAndModifiers.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 09/05/2024.
//

import SwiftUI

struct ViewsAndModifiers: View {
    var body: some View {
        VStack {
            CapsuleText(text: "First")
                .foregroundStyle(.red)
              CapsuleText(text: "Second")
                .foregroundStyle(.yellow)
            
            GridStack(rows: 4, columns: 4) { row, col in
                HStack {
                    Image(systemName: "\(row * 4 + col).circle")
                    Text("R\(row) C\(col)")
                }
            }
                
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
                .watermarked(with: "CDM")
            
            VStack {
              Text("Gryffindor")
                .blur(radius: 0)
              Text("Hufflepuff")
              Text("Ravenclaw")
                    .titleStyle()
              Text("Slytherin")
            }
            .blur(radius: 5)
            
            Button("Hello, world!") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 120)
            .background(.yellow)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.teal)
    }
}

#Preview {
    ViewsAndModifiers()
}
