//
//  TempCalculatorView.swift
//  TabBar
//
//  Created by Jacob Conacher on 10/24/22.
//

import SwiftUI

//Creates an enum with the two choices for the first picker
enum choice: String, CaseIterable, Identifiable {
    case ftoc = "°F → °C"
    case ctof = "°C → °F"
    
    var id: String {self.rawValue}
}

struct TempCalculatorView: View {
    
    //Declares all needed variables
    @State private var tempSelection = choice.ftoc
    @State private var selected = 32
    @State private var option = 0
    @State private var result = 0.00
    @State private var optionChar = "C"
    let pickerData = [Array(-129...134), Array(-90...57)]
    
    //This function changes certain variables depending on if the selection is c to f, or f to c
    func change() {
        
        if tempSelection == choice.ftoc {
            selected = 32
            option = 0
            optionChar = "C"
        }
        
        else {
            selected = 0
            option = 1
            optionChar = "F"
        }
        
    }
    
    //This function calculates what the result should be when the second picker is modified
    func calculate() {
        
        if tempSelection == choice.ftoc {
            result = (Double(selected) - 32) / 0.5556
        }
        
        else {
            result = Double(selected) * 0.5556 + 32
        }
        
    }
    
    var body: some View {
        VStack (spacing: 10){
            
            //Creates a text for the title
            Text("Temp Calculator")
                .font(.title)
                .bold()
                .padding()
            
            //Creates a picker to show the two options, f to c or c to f, and adds an onChange to check when modified
            Picker("Temperature Choice", selection: $tempSelection) {
                ForEach(choice.allCases) { c in
                    Text(c.rawValue.capitalized).tag(c)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .onChange(of: tempSelection) { tempSelection in
                change()
            }
            
            //Creates a picker that displays the entirety of the subarray of pickerData, dependign on which option is chosen, with an onChange to check when modified
            Picker("Temperature", selection: $selected) {
                ForEach(pickerData[option], id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .onChange(of: selected) { selected in
                calculate()
            }
            
            //Creates a text that displays the calculated result
            Text("\(String(format:"%.2f", result)) °\(optionChar)")
                .bold()
            
            Spacer()
            
        }
    }
    
}

struct TempCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TempCalculatorView()
    }
}
