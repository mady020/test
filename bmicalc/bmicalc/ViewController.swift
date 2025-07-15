//
//  ViewController.swift
//  bmicalc
//
//  Created by Student on 14/07/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func calculateButton(_ sender: Any) {
        guard let
                weight = Double(weightTextField.text ?? "") else{
            resultLabel.text = "Invalid Weight!"
            return
        }
        guard let
                height = Double(heightTextField.text ?? "") else{
            resultLabel.text = "Invalid Height!"
            return
        }
        let bmi = weight / (height * height)
        resultLabel.text = "Bmi: " + String(bmi)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

