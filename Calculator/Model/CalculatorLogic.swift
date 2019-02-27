//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Brad Martin on 2/26/19.
//  Copyright © 2019 BradleypmartinSandbox. All rights reserved.
//

// Foundation includes all Swift code BUT is a subset of UI View stuff we only need in the view
// components/controllers.
import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    private var intermediateCalc: (n1: Double, calcMethod: String)?
    
    // remember that alteration of attributes in struct objects need mutating methods!
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
                //            isFinishedTypingNumber = true
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalc = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalc?.n1, let operation = intermediateCalc?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Operation passed to calculator does not match any cases.")
            }
        }
        
        return nil
        
    }
    
    //What should happen when a number is entered into the keypad
    
    
    
}
