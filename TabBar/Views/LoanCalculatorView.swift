//
//  LoanCalculatorView.swift
//  TabBar
//
//  Created by Jacob Conacher on 10/24/22.
//

import SwiftUI

struct LoanCalculatorView: View {
    
    @State private var principal: String = ""
    @State private var interest: Double = 0.01
    
    var body: some View {
        VStack (spacing: 20){
            Text("Loan Calculator")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            TextField("Enter Principal", text: $principal)
                .keyboardType(.numbersAndPunctuation)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Stepper("Interest", value: $interest, in: 0.01...20.00, step: 0.01)
                .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct LoanCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCalculatorView()
    }
}
