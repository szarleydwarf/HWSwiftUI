//
//  Animations.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 28/05/2024.
//

import SwiftUI

struct Animations: View {
    var body: some View {
        NavigationStack {
            HStack {
                NavView(title: "Implicit", destination: Implicit())
                NavView(title: "Guess the Flag", destination: GuessTheFlag())
            }
        }
    }
}

#Preview {
    Animations()
}
