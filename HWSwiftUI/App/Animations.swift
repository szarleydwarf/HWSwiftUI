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
                NavView(title: "Animation Bindings", destination: AnimBindings())
            }
            HStack {
                NavView(title: "Explicit", destination: Explicit())
                NavView(title: "Animation Stack", destination: AnimStack())
            }
            HStack {
                NavView(title: "Gestures", destination: AnimGestures())
                NavView(title: "View Dis/Appearance", destination: AnimViews())
            }
        }
    }
}

#Preview {
    Animations()
}
