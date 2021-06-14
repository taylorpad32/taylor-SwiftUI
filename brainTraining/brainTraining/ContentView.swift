//
//  ContentView.swift
//  brainTraining
//
//  Created by paul taylor on 6/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var game = ["Rock", "Paper", "Scissors"] //.shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
   
    
    @State private var winLose = [" Win", " Lose"]
    @State private var correctAnswer1 = Int.random(in: 0...1)
    
    @State private var showingScore = false // tells us if alert is showing or not
    @State private var scoreTitle = "" // title inside the alert
    @State private var score = 0

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                           startPoint: .top, endPoint: .bottom)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the correct move")
                        .foregroundColor(.white)
                    Text(game[correctAnswer] + (winLose[correctAnswer1]))
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.gameTapped(number)
                    }) {
                        Text(self.game[number])
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    func gameTapped(_ number: Int) {
        if correctAnswer1 == 0 && number <= 2, number == correctAnswer + 1 {
                scoreTitle = "Correct"
               score += 100
        
       }    else if correctAnswer1 == 0, number == correctAnswer - 2 {
              scoreTitle = "Correct"
                 score += 100
        
    
        
       }    else if correctAnswer1 == 1 && number <= 2, number == correctAnswer + 2 {
                scoreTitle = "Correct"
                score += 100
        
       }    else if correctAnswer1 == 1, number == correctAnswer - 1 {
                scoreTitle = "Correct"
                score += 100
       
       
       }
       
       
            else {
            scoreTitle = "That is incorrect. \nPlease try again" // \(game[number])"
            score -= 100
        }
        showingScore = true
        
    }
    func askQuestion() {
        //game.shuffle()
        correctAnswer = Int.random(in: 0...2)
        correctAnswer1 = Int.random(in: 0...1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
