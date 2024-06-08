//
//  Moonshot.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 31/05/2024.
//

// continu page 270

import SwiftUI

struct Moonshot: View {
    @State private var showingList = false
//    @State private var toggleMessage: String = "Show as List"
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")    
    
    var body: some View {
        Toggle(isOn: $showingList) {}
//            .labelsHidden()
            .toggleStyle(HorizontalToggleStyle())
            
        Group {
            if !showingList {
                MoonshootGridLayout(astronauts: astronauts, missions: missions)
//                toggleMessage = "pl"
            } else {
                MoonshootListLayout(astronauts: astronauts, missions: missions)
//                toggleMessage = "ef"
            }
        }
        .navigationTitle("Moonshot")
        .padding(.bottom)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    Moonshot()
}
