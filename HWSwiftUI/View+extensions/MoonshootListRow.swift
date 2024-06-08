//
//  MoonshootListRow.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 07/06/2024.
//

import SwiftUI

struct MoonshootListRow: View {
    let mission: Mission
    var body: some View {
        HStack {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding()

            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundStyle(.white)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.lightBackground)
        }
        .clipShape(.rect(cornerRadius: 10))
        .overlay (
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        )
    }
}

#Preview {
    MoonshootListRow(mission: Mission(id: 0, launchDate: .now, crew: [Mission.CrewRole(name: "test", role: "test")], description: "test"))
}
