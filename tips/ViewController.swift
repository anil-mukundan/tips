//
//  ViewController.swift
//  tips
//
//  Created by Anil Mukundan on 9/4/15.
//  Copyright (c) 2015 Mukundan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages = [0.15, 0.18, 0.2]
    var defaultTipIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.0"
        totalLabel.text = "$0.0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        tipPercentages = defaults.objectForKey("tipPercentages") as Array
        defaultTipIndex = defaults.integerForKey("defaultTipIndex")
        tipControl.selectedSegmentIndex = defaultTipIndex
        
        recalculate()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        recalculate()
    }
    
    func recalculate() {
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = tipPercentage * billAmount
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

