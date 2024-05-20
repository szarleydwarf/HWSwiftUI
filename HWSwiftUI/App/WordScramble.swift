//
//  WordScramble.swift
//  HWSwiftUI
//
//  Created by Radoslaw Chomik on 16/05/2024.
//

import SwiftUI

struct WordScramble: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0
    @FocusState private var isFocused: Bool
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                        .focused($isFocused)
                }
                
                Section {
                    Text("Your score: \(score)")
                }
                
                Section {
                    ForEach(usedWords, id: \.self) {word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .toolbar {
                Button("New Game") {
                    startGame()
                }
            }
        }
        .onAppear(perform: startGame)
        .alert(errorTitle, isPresented: $showingError) {} message: {
            Text(errorMessage)
                .modifier(Title())
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard isLongerThan2Chars(word: answer)  else {
            wordError(title: "Word to short.", message: "Word must be at least 3 characters long.")
            return
        }
        guard isNotRootWord(word: answer)  else {
            wordError(title: "Root Word.", message: "This is Root word. Be more original.")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "Only English words allowed")
            return
        }
        
        setScore(number: answer.count + 1)
        
        withAnimation {
            usedWords.insert(answer, at: 0)
            isFocused = true
        }
        newWord = ""
    }
    
    func setScore(number: Int) {
        score += number
    }
    
    func isLongerThan2Chars(word: String) -> Bool {
        word.count > 2
    }
    
    func isNotRootWord(word: String) -> Bool  {
        !word.elementsEqual(rootWord)
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                isFocused = true
                return
            }
        }
        fatalError("Loading start.txt failed")
    }
}

#Preview {
    WordScramble()
}
