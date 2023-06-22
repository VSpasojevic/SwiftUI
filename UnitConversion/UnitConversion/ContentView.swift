//
//  ContentView.swift
//  UnitConversion
//
//  Created by Vladimir Spasojevic on 6/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var intialUnitValue = 0.0
    @State private var intialUnit = 0
    @State private var selectedlUnit = 0
//    meters, kilometers, feet, yard, or miles
    private let unitArray = ["m", "km", "feet", "yards"]

    var conversionFactor: Double {
            let initialUnitValue = unitArray[intialUnit]
            let desiredUnitValue = unitArray[selectedlUnit]

            let meterToKilometer: Double = 0.001
            let meterToYard: Double = 1.09361
            let meterToFeet: Double = 3.28084

            switch (initialUnitValue, desiredUnitValue) {
            case ("m", "km"):
                return meterToKilometer
            case ("m", "yards"):
                return meterToYard
            case ("m", "feet"):
                return meterToFeet
            case ("km", "m"):
                return 1/meterToKilometer
            case ("km", "yards"):
                return meterToKilometer * meterToYard
            case ("km", "feet"):
                return meterToKilometer * meterToFeet
            case ("yards", "m"):
                return 1/meterToYard
            case ("yards", "km"):
                return 1/(meterToKilometer * meterToYard)
            case ("yards", "feet"):
                return meterToYard * meterToFeet
            case ("feet", "m"):
                return 1/meterToFeet
            case ("feet", "km"):
                return 1/(meterToKilometer * meterToFeet)
            case ("feet", "yards"):
                return 1/meterToYard
            default:
                return 1
            }
        }

    var convertedValue : Double {
        return intialUnitValue * conversionFactor
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Unit value", value: $intialUnitValue, format: .number)
                            .keyboardType(.decimalPad)
                } header: {
                    Text("Enter value")
                }

                Section {
                    Picker("Chose unit", selection: $intialUnit) {
                        ForEach(0..<unitArray.count, id: \.self) { index in
                            Text(unitArray[index])
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Chose unit")
                }

                Section {
                    Picker("Chose unit", selection: $selectedlUnit) {
                        ForEach(0..<unitArray.count, id: \.self) { index in
                            Text(unitArray[index])
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert to")
                }

                Section {
                    Text(convertedValue, format: .number)
                }
            }
        }
        .navigationTitle("Unit conversions")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
