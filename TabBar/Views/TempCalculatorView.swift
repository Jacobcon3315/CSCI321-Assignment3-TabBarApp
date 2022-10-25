//
//  TempCalculatorView.swift
//  TabBar
//
//  Created by Jacob Conacher on 10/24/22.
//

import SwiftUI

enum choice: String, CaseIterable, Identifiable {
    case ftoc = "°F → °C"
    case ctof = "°C → °F"
    
    var id: String {self.rawValue}
}

struct TempCalculatorView: View {
    
    @State private var tempSelection = choice.ftoc
    @State private var selected = 32
    @State private var option = 0
    @State private var result = 0.00
    @State private var optionChar = "C"
    let pickerData = [Array(-129...134), Array(-90...57)]
    
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
            
            Text("Temp Calculator")
                .font(.title)
                .bold()
                .padding()
            
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
            
            Picker("Temperature", selection: $selected) {
                ForEach(pickerData[option], id: \.self) {
                    Text("\($0)")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .onChange(of: selected) { selected in
                calculate()
            }
            
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
