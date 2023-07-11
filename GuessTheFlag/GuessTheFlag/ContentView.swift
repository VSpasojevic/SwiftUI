//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Vladimir Spasojevic on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Color(red: 1, green: 0.8, blue: 0)
                    .frame(width: 200, height: 200, alignment: .leading)
                Text("Some text")
            }

            ZStack {
                Color(red: 0.8, green: 1, blue: 0)
                    .frame(width: 200, height: 200, alignment: .leading)
                Text("Some text")
            }

            ZStack {
                Color.red
                    .frame(width: 200, height: 200, alignment: .leading)
                Text("Some text")
                    .foregroundStyle(.secondary)
                    .padding(20)
                    .background(.ultraThinMaterial)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
