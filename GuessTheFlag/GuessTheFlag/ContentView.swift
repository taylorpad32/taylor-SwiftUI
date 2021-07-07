//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by paul taylor on 5/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false // tells us if alert is showing or not
    @State private var scoreTitle = "" // title inside the alert
    @State private var score = 0
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]),
                           startPoint: .top, endPoint: .bottom)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
  
                ForEach(0 ..< 3) { number in
                    FlagButton(country: self.countries[number]) {
                        flagTapped(number)
                    }
                    .rotation3DEffect(.degrees(number == correctAnswer ? animationAmount: 0), axis: (x: 0, y: 1, z: 0))
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
    

    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 100
                withAnimation {
                    self.animationAmount += 360
               }
    
        } else {
            scoreTitle = "Wrong. This was the flag of \(countries[number])"
            score -= 100
        }
        showingScore = true
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct FlagButton: View {
    var country: String
    var onTap: () -> ()
    var body: some View {
        Button(action: {
            self.onTap()
        }) {
    Image(country)
        .renderingMode(.original)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
        .shadow(color: .black, radius: 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
