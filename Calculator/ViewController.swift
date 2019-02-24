//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber = true
    
    // cool use of computed property!
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        
        
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
                displayValue *= -1
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
                isFinishedTypingNumber = true
            } else if calcMethod == "%" {
                displayValue *= 0.01
            }
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = (numValue == ".") ? "0." : numValue
                isFinishedTypingNumber = false
            } else {
                
                if numValue == "." {
                    if !displayLabel.text!.contains(".") {
                        displayLabel.text = displayLabel.text! + numValue
                    }
                } else {
                    displayLabel.text = displayLabel.text! + numValue
                }
                
            }
            
        }
        
    }

}
