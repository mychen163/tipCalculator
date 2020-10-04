//
//  ViewController.swift
//  tipCalculator
//
//  Created by M.y Chen on 9/29/20.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    let defaults = UserDefaults.standard
    let tipPercentages = [0.15,0.18,0.2]
    var tipPercentage = 0.0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        billAmountTextField.becomeFirstResponder()
        billAmountTextField.delegate = self
        billAmountTextField.enablesReturnKeyAutomatically = true
        tipAmountSegmentControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTipPercentageIndex")
        tipPercentage = tipPercentages[tipAmountSegmentControl.selectedSegmentIndex]
        
    }
    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipAmountSegmentControl: UISegmentedControl!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLable: UILabel!
    
    
    @IBAction func onTap(_ sender: Any) {
        
    }
    
    
    @IBAction func tipCalculate(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        //Calculate tip and total
        let tip = bill * tipPercentages[tipAmountSegmentControl.selectedSegmentIndex]
        let total = bill + tip
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLable.text = String(format: "$%.2f", total)
    }
    
    @IBAction func tipCalculation(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        //Calculate tip and total
        let tip = bill * tipPercentage
        let total = bill + tip
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLable.text = String(format: "$%.2f", total)
    }
    
    @IBAction func tipPercentageChoose(_ sender: Any) {
        tipPercentage = tipPercentages[tipAmountSegmentControl.selectedSegmentIndex]
    }
    
    
}

