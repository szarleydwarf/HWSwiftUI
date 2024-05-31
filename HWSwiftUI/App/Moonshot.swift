//
//  Moonshot.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 31/05/2024.
//

// continu page 270

import SwiftUI

struct Moonshot: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
          {
            "name": "Taylor Swift",
            "address": {
              "street": "555, Taylor Swift Avenue",
              "city": "Nashville"
            }
        }
        """
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
        
        let layout = [
          GridItem(.adaptive(minimum: 80, maximum: 120)),
        ]
        
        NavigationStack {
            NavigationLink {
                Text("tsap")
                
            } label: {
                VStack {
                    Text("label")
                    Image(systemName: "face.smiling")
                }
            }
            .navigationTitle("swiftui")
            .font(.largeTitle)
        }
        Image(.ex)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
        
        ScrollView {
            LazyVGrid (columns: layout) {
                ForEach(0..<100) {
                    Text("Item: \($0)")
                        .font(.body)
                }
            }
            .frame(maxWidth: .infinity)
        }
        
        Image(.ex)
            .resizable()
            .scaledToFill()
            .containerRelativeFrame(.horizontal) { size, _ in
                size * 0.8
            }
    }
}

#Preview {
    Moonshot()
}

struct User: Codable {
    let name: String
    let address: Address
}
struct Address: Codable {
    let street: String
    let city: String
}
