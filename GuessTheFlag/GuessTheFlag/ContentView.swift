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
            Spacer()
            HStack (spacing: 20) {
                Text(" first")
                Text(" second")
                Text(" third")
            }

            Spacer()

            HStack (spacing: 20) {
                Text(" first")
                Text(" second")
                Text(" third")
            }

            Spacer()

            HStack (spacing: 20) {
                Text(" first")
                Text(" second")
                Text(" third")
            }
            Spacer()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
