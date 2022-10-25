//
//  LoanCalculatorView.swift
//  TabBar
//
//  Created by Jacob Conacher on 10/24/22.
//

import SwiftUI

struct LoanCalculatorView: View {
    
    @State private var principal: String = "145000"
    @State private var interest: Double = 4.65
    @State private var years: Double = 25
    @State private var payment: Double = 0.00
    
    func compute() {
        
        let principalD = Double(principal)
        let intDivide = (interest / 100.0) / 12.0
        let pow1 = pow((1.0 + intDivide),(years * 12.0))
        
        payment = (principalD! * intDivide * pow1) / (pow1 - 1.0)
        
    }
    
    var body: some View {
        VStack (spacing: 20){
            Text("Loan Calculator")
                .font(.title)
                .bold()
                .padding()
            
            TextField("Enter Principal", text: $principal)
                .keyboardType(.numbersAndPunctuation)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Stepper("Interest", value: $interest, in: 0.01...20.00, step: 0.01)
                .padding(.horizontal)
                .bold()
            
            HStack {
                
                Text("Annual Rate")
                    .bold()
                    .padding(.horizontal)
                    
                Spacer()
                
                Text("\(String(format:"%.2f", interest))%")
                    .padding(.horizontal)
                
            }
            
            HStack {
                
                Text("Number of Years")
                    .bold()
                    .padding(.horizontal)
                    
                Spacer()
                
                Text("\(String(format:"%.0f", years)) years")
                    .padding(.horizontal)
                
            }
            
            HStack {
                
                Text("10")
                    .padding(.horizontal)
                
                Slider(value: $years, in: 10...30, step: 5)
                    .padding(.horizontal)
                
                Text("30")
                    .padding(.horizontal)
                
            }
            
            Button (action: {
                compute()
            }, label: {
              Text("Calculate")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(50)
            })
            
            HStack {
                
                Text("Monthly Payment")
                    .bold()
                    .padding(.horizontal)
                    
                Spacer()
                
                Text("$\(String(format:"%.2f", payment))")
                    .padding(.horizontal)
                
            }
            
            Spacer()
        }
    }
}

struct LoanCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCalculatorView()
    }
}
