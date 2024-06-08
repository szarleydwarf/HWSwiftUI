//
//  ContentView.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        Text("Hacking with SwiftUI")
            .font(.title)
        NavigationStack {
            HStack {
                NavView(title: "We Split", destination: WeSplit())
                NavView(title: "Guess the Flag", destination: GuessTheFlag())
            }
            HStack {
                NavView(title: "Views And Modifiers", destination: ViewsAndModifiers())
                NavView(title: "Better Rest", destination: BetterRest())
            }
            HStack {
                NavView(title: "Word Scramble", destination: WordScramble())
                NavView(title: "Animations", destination: Animations())
            }
            HStack {
                NavView(title: "iExpense", destination: iExpense())
                NavView(title: "Moonshot", destination: Moonshot())
            }
            HStack {
                NavView(title: "Navigation", destination: Navigation())
                NavView(title: "placeholder", destination: Placeholder())
            }
        }
    }
}

#Preview {
    ContentView()
}
