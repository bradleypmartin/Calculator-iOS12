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
    
    // remember that alteration of attributes in struct objects need mutating methods!
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        
        if let n = number {
            if symbol == "+/-" {
                return n * -1
            } else if symbol == "AC" {
                return 0
                //            isFinishedTypingNumber = true
            } else if symbol == "%" {
                return n * 0.01
            }
        }
        
        return nil
        
    }
    
    //What should happen when a number is entered into the keypad
    
    
    
}
