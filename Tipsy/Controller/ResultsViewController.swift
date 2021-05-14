//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Camilo Moreno on 24/03/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var result: String?
    var message: String?
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = result
        messageLabel.text = message
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
   

}
