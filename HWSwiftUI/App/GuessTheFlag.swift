//
//  GuessTheFlag.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 08/05/2024.
//

import SwiftUI

struct GuessTheFlag: View {
    @State private var showingScore = false
    @State private var showingEndGame = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionCount = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland",
                     "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
        .shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
              ], center: .top, startRadius: 120, endRadius: 900)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap flag of")
                            .foregroundStyle(.secondary)
                            .font(.headline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.primary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    .foregroundColor(.white)
                    .font(.title2)
                    
                    ForEach(0..<3) { number in
                        Button {
                            print("Number: \(number)")
                            flagTapped(number)
                            checkScore(number)
                        } label: {
                            FlagImage(countryName: countries[number])
                        }
                        .alert("Game Over\nYour total score is \(score)", isPresented: $showingEndGame) {
                            Button("Reset Game", action: resetGame)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
            .padding()
            
            Spacer()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Again", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Ups!\nThats flag of \(countries[number]) \nTry again"
        }
        
        showingScore = true
    }
    
    func checkScore(_ number: Int) {
        if number == correctAnswer {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            }
        }
    }
    
    func nextRoundOrReset() {
        if questionCount > 7 {
            showingEndGame = true
        }
        questionCount += 1
    }
    
    func resetGame() {
        questionCount = 0
        score = 0
    }
    
    func askQuestion() {
        nextRoundOrReset()
        if !showingEndGame {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
}

#Preview {
    GuessTheFlag()
}
