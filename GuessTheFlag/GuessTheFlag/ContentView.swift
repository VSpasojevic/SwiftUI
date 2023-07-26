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

    @State private var numberOfQuestions = 8
    @State private var currentQuestion = 0

    var body: some View {
        ZStack{
            RadialGradient( stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)

                VStack(spacing: 20) {
                    Text("Tap the flag of: ")
                        .foregroundColor(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
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
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                .alert(scoreTitle, isPresented: $scoreShowing) {
                    if currentQuestion != numberOfQuestions {
                        Button("Continue", action: askQuestion)
                    } else {
                        Button("Restart game", action: restartGame)
                    }

                }

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
    }

    func checkAnswer(_ number: Int) {
        currentQuestion = currentQuestion + 1
        if number == correctAnswer {
            scoreTitle = "Correct"
            score = score + 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score = score - 1
        }

        scoreShowing = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func restartGame() {
        score = 0
        currentQuestion = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
