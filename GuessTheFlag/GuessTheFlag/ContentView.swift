//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Vladimir Spasojevic on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreShowing = false
    @State private var scoreTitle = ""
    @State private var score = 0

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Tap the flag of: ")
                    .foregroundColor(.orange)
                    .font(.subheadline.weight(.heavy))
                Text(countries[correctAnswer])
                    .foregroundColor(.orange)
                    .font(.largeTitle.weight(.semibold))
                ForEach(0..<3) { number in
                    Button {
                        print("Flag of \(countries[number]) was tapped")
                        checkAnswer(number)

                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                    }
                    .border(.gray)
                }
            }
            .alert(scoreTitle, isPresented: $scoreShowing) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is : \(score)")
            }
        }
    }

    func checkAnswer(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score = score + 1
        } else {
            scoreTitle = "Wrong"
            score = score - 1
        }

        scoreShowing = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
