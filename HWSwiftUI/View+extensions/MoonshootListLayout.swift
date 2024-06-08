//
//  MoonshootListLayout.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 04/06/2024.
//

import SwiftUI

struct MoonshootListLayout: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]

    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    
//                } label: {
                   MoonshootListRow(mission: mission)
                }
            }
            .navigationDestination(for: Mission.self) { selectedMission in
                Text("Your selected mission \(selectedMission.printMission)")
//                MissionView(mission: selectedMission, astronauts: astronauts)
            }
        }
    }
}
