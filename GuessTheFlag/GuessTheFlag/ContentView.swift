//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Vladimir Spasojevic on 6/30/23.
//

import SwiftUI

struct ContentView: View {

    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    var correctAnswer = Int.random(in: 0...2)

    var body: some View {
        VStack(spacing: 30) {
            Text("Tap the flag of: ")
            Text(countries[correctAnswer])

            ForEach(0..<3) { number in
                Button {
                    print("Flag was tapped")
                } label: {
                    Image(countries[number])
                }
                .border(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
