//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Float = 0.1
    var calculateBrain = CalculatorBrain()
    var split:Int!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        sender.isSelected = true
        if sender.currentTitle == "0%" {
            tip = 0.0
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }else if sender.currentTitle == "10%"{
            tip = 0.1
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }else{
            tip = 0.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
        }
    }
    
    @IBAction func stepperValuechanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        split = Int(splitNumberLabel.text!) ?? 2
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = Float(billTextField.text!) ?? 0.0
        calculateBrain.calculateResult(bill, tip, split)

        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = calculateBrain.getValue()
            destinationVC.message = calculateBrain.getMessage(tip, split)
        }
    }
}

