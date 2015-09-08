//
//  SettingsViewController.swift
//  tips
//
//  Created by Anil Mukundan on 9/8/15.
//  Copyright (c) 2015 Mukundan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var notHappyTip: UITextField!
    
    @IBOutlet weak var satisfieldTip: UITextField!
    
    @IBOutlet weak var veryHappyTip: UITextField!
    
    @IBOutlet weak var notHappyDefaultSwitch: UISwitch!
    
    @IBOutlet weak var satisfieldDefaultSwitch: UISwitch!
    
    @IBOutlet weak var veryHappyDefaultSwitch: UISwitch!
    
    var tipPercentages = [0.15, 0.18, 0.2]
    
    var defaultTipIndex = 1

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notHappyTip.text = "15"
        satisfieldTip.text = "18"
        veryHappyTip.text = "20"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func notHappyTipValueChanged(sender: AnyObject) {
        if notHappyDefaultSwitch.on {
            defaultTipIndex = 0
            //satisfieldDefaultSwitch.setOn(false, animated: true)
            //veryHappyDefaultSwitch.setOn(false, animated: true)
        } else {
            defaultTipIndex = 1
            //satisfieldDefaultSwitch.setOn(true, animated: true)
        }
    }
    
    @IBAction func satisfieldTipValueChanged(sender: AnyObject) {
        if satisfieldDefaultSwitch.on {
            defaultTipIndex = 0
            //notHappyDefaultSwitch.setOn(false, animated: true)
            //veryHappyDefaultSwitch.setOn(false, animated: true)
        } else {
            defaultTipIndex = 2
            //veryHappyDefaultSwitch.setOn(true, animated: true)
        }
    }
    
    
    @IBAction func veryHappyValueChanged(sender: AnyObject) {
        if veryHappyDefaultSwitch.on {
            defaultTipIndex = 0
            //satisfieldDefaultSwitch.setOn(false, animated: true)
            //notHappyDefaultSwitch.setOn(false, animated: true)
        } else {
            defaultTipIndex = 1
            //satisfieldDefaultSwitch.setOn(true, animated: true)
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onTouchDown(sender: AnyObject) {
        tipPercentages[0] = NSString(string: notHappyTip.text).doubleValue / 100
        tipPercentages[1] = NSString(string: satisfieldTip.text).doubleValue / 100
        tipPercentages[2] = NSString(string: veryHappyTip.text).doubleValue / 100
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tipPercentages, forKey: "tipPercentages")
        defaults.setInteger(defaultTipIndex, forKey: "defaultTipIndex")
        defaults.synchronize()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
