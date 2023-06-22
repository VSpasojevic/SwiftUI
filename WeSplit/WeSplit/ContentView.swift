//
//  ContentView.swift
//  WeSplit
//
//  Created by Vladimir Spasojevic on 2/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    @FocusState private var showKeyboard : Bool

    private let percantageAmount = [10, 15, 20, 0]

    var totalAmount : Double {
        let tip = (checkAmount / 100 * Double(tipPercentage))
        let checkWithTipsAmount = Double(checkAmount + tip)

        return checkWithTipsAmount / Double(numberOfPeople + 2)
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.decimalPad)
                            .focused($showKeyboard)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<5) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.automatic)
                }

                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(percantageAmount, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Tip for a waiter")
                }

                Section {
                    Text(totalAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("We Split")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        showKeyboard = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
