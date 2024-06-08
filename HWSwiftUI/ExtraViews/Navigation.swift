//
//  Navigation.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 04/06/2024.
//

import SwiftUI

struct Navigation: View {
    @State private var patStore = NavPathStore()
    @State private var nav = NavigationPath()
    @State private var title = "SwiftUI"
    
    var body: some View {
        //        NavigationStack(path: $nav) {
        //            Button("554"){
        //                nav.append(554)
        //            }
        //            Button("HELLO") {
        //                nav.append("HELLO")
        //            }
        //        }
        
        NavigationStack(path: $patStore.path) {
            //            DetTest(number: 0)
            //                .navigationDestination(for: Int.self) { i in
            //                    DetTest(number: i)
            //                }
            //            VStack {
            //                Button("Show 32") {
            //                    pat = [32, 44]
            //                }
            //                Button("Show 55") {
            //                    pat.append(55)
            //                }
            //            }
            //            .navigationDestination(for: Int.self) { selected in
            //                Text("Selection - \(selected)")
            //            }
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Tap Me") {
                        // button action here
                    }
                    Button("Tap Me 2") {
                        // button action here
                    }
                }
            }
        }
    }
}

#Preview {
    Navigation()
}

struct DetTest: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Rand number", value: Int.random(in: 1...1000))
            .navigationTitle("Number \(number)")
        //            .toolbar {
        //                Button("Home") {
        //                    pat.removeAll()
        //                }
        //            }
    }
}
