//
//  Animations.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 20/05/2024.
//

import SwiftUI

struct Animations: View {


    var body: some View {
        VStack {
            NavView(title: "Implicit/Explicit", destination: ImplExplAnimations())
            NavView(title: "Gestures", destination: GesturesAnimations())

            
        }
    }
}

#Preview {
    Animations()
}
