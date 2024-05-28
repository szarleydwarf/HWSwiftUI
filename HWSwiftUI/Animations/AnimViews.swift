//
//  AnimViews.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 28/05/2024.
//

import SwiftUI

struct AnimViews: View {
    @State private var isShowingFirstView = false
    @State private var isShowingSecondView = false
    @State private var enabled = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
        
            if isShowingSecondView {
                Rectangle()
                    .fill(.white)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            
            }
            Text("Tap me")
                .font(.largeTitle)
                .foregroundStyle(enabled ? .black : .white)
        }
        .onTapGesture {
            withAnimation {
                isShowingSecondView.toggle()
                enabled.toggle()
            }
        }
        
        VStack {
            Button("Tap") {
                withAnimation {
                    isShowingFirstView.toggle()
                }
            }
            .padding(20)
            .background(.black)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: 10))
 
            if isShowingFirstView {
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
