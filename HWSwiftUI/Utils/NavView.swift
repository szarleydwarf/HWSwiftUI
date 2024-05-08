//
//  NavView.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 07/05/2024.
//

import SwiftUI

struct NavView<Destination:View>: View {
    var title = "Press"
    var destination: Destination
    
    var body: some View {
        VStack {
            NavigationLink(destination: destination, label: {
                Text(title)
            })
            .frame(width: 170, height: 50, alignment: .center)
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
