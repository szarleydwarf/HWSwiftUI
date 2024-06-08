//
//  HorizontalToggleStyle.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 04/06/2024.
//
// Credits:
// https://sarunw.com/posts/swiftui-toggle-customization/

import SwiftUI

struct HorizontalToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return VStack(alignment: .leading) {
            configuration.label
                .font(.system(size: 22, weight: .semibold)).lineLimit(2)
            HStack {
                if configuration.isOn {
                    Text("Show as Grid")
                        .foregroundStyle(configuration.isOn ? Color.green: Color.purple)
                } else {
                    Text("Show as List")
                        .foregroundStyle(configuration.isOn ? Color.green: Color.purple)
                }
                Spacer()
                Toggle(configuration).labelsHidden()
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(configuration.isOn ? Color.green: Color.gray, lineWidth: 2)
        )
    }
}
