//
//  ContentView.swift
//  converter
//
//  Created by Furkan İSLAM on 9.01.2025.
//

import SwiftUI



struct ContentView: View {
    
    @State private var inputValue = 0.0
    @State private var inputUnit = "Milimetre"
    @State private var outputUnit = "Metre"
    
    @FocusState private var amountIsFocuesed: Bool
    
    let units = ["Milimetre","Santimetre","Metre","Kilometre"]
    
    var converterTemp: Double {
        var newTemp = 0.0
        
        if outputUnit == inputUnit {
            newTemp = inputValue
        } else if outputUnit == "Santimetre" && inputUnit == "Milimetre" {
            newTemp = inputValue / 10
        } else if outputUnit == "Metre" && inputUnit == "Milimetre" {
            newTemp = inputValue / 1000
        } else if outputUnit == "Kilometre" && inputUnit == "Milimetre" {
            newTemp = inputValue / 1000000
        } else if outputUnit == "Milimetre" && inputUnit == "Santimetre" {
            newTemp = inputValue * 10
        } else if outputUnit == "Metre" && inputUnit == "Santimetre" {
            newTemp = inputValue / 100
        } else if outputUnit == "Kilometre" && inputUnit == "Santimetre" {
            newTemp = inputValue / 100000
        } else if outputUnit == "Milimetre" && inputUnit == "Metre" {
            newTemp = inputValue * 1000
        } else if outputUnit == "Santimetre" && inputUnit == "Metre" {
            newTemp = inputValue * 100
        } else if outputUnit == "Kilometre" && inputUnit == "Metre" {
            newTemp = inputValue / 1000
        } else if outputUnit == "Milimetre" && inputUnit == "Kilometre" {
            newTemp = inputValue * 1000000
        } else if outputUnit == "Santimetre" && inputUnit == "Kilometre" {
            newTemp = inputValue * 100000
        } else if outputUnit == "Metre" && inputUnit == "Kilometre" {
            newTemp = inputValue * 1000
        }
        
        return newTemp
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Please select a unit") {
                    Picker("Input Leght", selection: $inputUnit) {
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Please select a unit") {
                    Picker("Output Leght", selection: $outputUnit) {
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Input") {
                    TextField("Amount", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocuesed)
                }
                
                Section("Output") {
                    Text(converterTemp, format: .number)
                }
            }
            .navigationTitle("Leght Converter")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocuesed = false
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
