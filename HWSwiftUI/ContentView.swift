//
//  ContentView.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    let apps = [
        NavView(title: "We Split", destination: WeSplit())
    ]
    var body: some View {
        
        Text("Let's go")
            .font(.title)
        NavigationStack {
            ForEach(apps, id: \.self.title) {app in
                app
            }
        }
    }
}

#Preview {
    ContentView()
}
