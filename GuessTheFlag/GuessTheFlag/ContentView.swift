//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Vladimir Spasojevic on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    var body: some View {
        VStack {
            Button("Button 1") {}

            Button("Button 2", role: .destructive) {}

            Button("Button 3") {}
                .buttonStyle(.bordered)
                .tint(.cyan)
            Spacer()
            Button("Button 4") {}
                .buttonStyle(.borderedProminent)
            Spacer()
            LinearGradient(colors: [.red, .white], startPoint: .leading, endPoint: .trailing)
            Button("Show alert") {
                showAlert = true
            }
            .alert("This is title for alert", isPresented: $showAlert) {
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Read the description carefully!")
            }


            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: .yellow, location: 0.3),
                Gradient.Stop(color: .red, location: 0.7),
            ]), startPoint: .top, endPoint: .bottom)


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
