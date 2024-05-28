//
//  AnimViews.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 28/05/2024.
//

import SwiftUI

struct AnimViews: View {
    @State private var isShowingView = false
    
    var body: some View {
        VStack {
            Button("Tap") {
                withAnimation {
                    isShowingView.toggle()
                }
            }
            .padding(20)
            .background(.black)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10))
 
            if isShowingView {
                Rectangle()
                    .fill(.purple)
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    AnimViews()
}
