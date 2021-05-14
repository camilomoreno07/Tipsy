//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Camilo Moreno on 24/03/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var calculate:Float?
    
    mutating func calculateResult(_ bill: Float, _ tip:Float ,_ split:Int) {
        
        let billTotal = bill + (tip * bill)
        calculate = billTotal / Float(split)
    }
    
    func getValue() -> String {
        let decimal = String(format: "%.2f", calculate ?? 0.0)
        return decimal
    }
    
    func getMessage(_ tip: Float, _ split:Int) -> String {
        var tipMessage = 0
        switch tip {
        case 0.0:
            tipMessage = 0
        case 0.1:
            tipMessage = 10
        case 0.2:
            tipMessage = 20
        default:
            print("wtf")
        }
        return "Split between \(split) people, with \(tipMessage)% tip."
    }
}
