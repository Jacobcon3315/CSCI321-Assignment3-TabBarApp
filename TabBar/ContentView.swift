//
//  ContentView.swift
//  TabBar
//
//  Created by Jacob Conacher on 10/24/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TempCalculatorView()
                .tabItem {
                    Label("Temperature", image: "Temperature")
                }
            LoanCalculatorView()
                .tabItem {
                    Label("Mortgage", image: "House")
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
