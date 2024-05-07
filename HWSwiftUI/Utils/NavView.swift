//
//  NavView.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 07/05/2024.
//

import SwiftUI

struct NavView: View {
    var title = "Press"
    var destination = Placeholder()
    
    var body: some View {
            VStack {
                NavigationLink(title, destination: destination)
                    .padding(8)
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }
        }
}

struct Placeholder: View {
    var body: some View {
        Text("placeholder")
    }
}

#Preview {
    NavView()
}
