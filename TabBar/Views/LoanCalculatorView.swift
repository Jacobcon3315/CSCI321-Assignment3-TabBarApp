//
//  LoanCalculatorView.swift
//  TabBar
//
//  Created by Jacob Conacher on 10/24/22.
//

import SwiftUI

struct LoanCalculatorView: View {
    
    //Declares needed variables
    @State private var principal: String = ""
    @State private var interest: Double = 4.50
    @State private var years: Double = 15
    @State private var payment: Double = 0.00
    @State private var alertText: String = "Enter valid principal amount"
    @State private var showAlert = false
    
    //This function checks if the input principal amount is valid and calculates the payment
    func compute() {
        
        //Checks if the input value is valid
        guard let principalD = Double(principal) else {
            showAlert = true
            return
        }
        //Calculates the payment
        let intDivide = (interest / 100.0) / 12.0
        let pow1 = pow((1.0 + intDivide),(years * 12.0))
        
        payment = (principalD * intDivide * pow1) / (pow1 - 1.0)
        
    }
    
    var body: some View {
        VStack (spacing: 20){
            
            //Creates a text for the title
            Text("Loan Calculator")
                .font(.title)
                .bold()
                .padding()
            
            //Creates a text field for the user to input the principal amount
            TextField("Enter principal", text: $principal)
                .keyboardType(.numbersAndPunctuation)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            //Creates a stepper that goes from 0.01 to 20.00 with the step of 0.01
            Stepper("Interest", value: $interest, in: 0.01...20.00, step: 0.01)
                .padding(.horizontal)
                .bold()
            
            //Creates an HStack for two texts that displays the interest rate from the stepper
            HStack {
                
                Text("Annual Rate")
                    .bold()
                    .padding(.horizontal)
                    
                Spacer()
                
                Text("\(String(format:"%.2f", interest))%")
                    .padding(.horizontal)
                
            }
            
            //Creates an HStack that displays the number of years from the slider
            HStack {
                
                Text("Number of Years")
                    .bold()
                    .padding(.horizontal)
                    
                Spacer()
                
                Text("\(String(format:"%.0f", years)) years")
                    .padding(.horizontal)
                
            }
            
            //Creates an HStack that has two texts on either side of a slider that goes from 10 to 30 with a step of 5
            HStack {
                
                Text("10")
                    .padding(.horizontal)
                
                Slider(value: $years, in: 10...30, step: 5)
                    .padding(.horizontal)
                
                Text("30")
                    .padding(.horizontal)
                
            }
            
            //Creates a button that will calculate the total payment when clicked
            Button (action: {
                compute()
            }, label: {
              Text("Calculate")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(50)
            })
            
            //Creates an HStack that displays the total montly payment
            HStack {
                
                Text("Monthly Payment")
                    .bold()
                    .padding(.horizontal)
                    
                Spacer()
                
                Text("$\(String(format:"%.2f", payment))")
                    .padding(.horizontal)
                
            }
            
            Spacer()
            
            //Shows an alert when the principal value is invalid
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Error"),
                        message: Text(alertText)
                    )
                }
            
        }
    }
}

struct LoanCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        LoanCalculatorView()
    }
}
