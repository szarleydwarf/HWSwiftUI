//
//  ContentView.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        Text("Let's go")
            .font(.title)
        NavigationStack {
            HStack {
                NavView(title: "We Split", destination: WeSplit())
                NavView(title: "Guess the Flag", destination: GuessTheFlag())
            }
        }
    }
}

#Preview {
    ContentView()
}
