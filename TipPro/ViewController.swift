//
//  ViewController.swift
//  TipPro
//
//  Created by Fiona Carty on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit


// main stuff
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmountField.delegate = self 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // makes the iPhone status bar a bit prettier 
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        guard let billAmount = Double(billAmountField.text!)else{
            
            // if it doesn't contain a number:
            // it will reset all text fields & return it immeadiately
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
            return // show error
            
            // if it DOES contain a number the function will continue
        }
        
        // init tipPercentage
        var tipPercentage = 0.0
        
        // options for selecting different tipPercentages
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
        
        // setting values to calculate:
        // roundedBillAmount, tipAmount, roundedTipAmount, & totalAmount
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        
        
        if (!billAmountField.editing){
            billAmountField.text = String(format :"%.2f", roundedBillAmount)
        }
        
        // will update the text fields with the calculated tip & total amount
        
        tipAmountField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountField.text = String(format: "%.2f", totalAmount)
    }

}

