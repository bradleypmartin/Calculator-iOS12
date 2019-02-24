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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display label text to Double.")
        }
        
        if let calcMethod = sender.currentTitle {
            
            if calcMethod == "+/-" {
                print(number)
                print(number * -1.0)
                displayLabel.text = String(number * -1.0)
            } else if calcMethod == "AC" {
                displayLabel.text = "0"
                isFinishedTypingNumber = true
            } else if calcMethod == "%" {
                displayLabel.text = String(number * 0.01)
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
