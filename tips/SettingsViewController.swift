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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func onDefaultChanged(sender: AnyObject) {
        
    }
    
    @IBAction func onTouchDown(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(notHappyTip.text, forKey: "notHappyTip")
        defaults.setObject(satisfieldTip.text, forKey: "satisfieldTip")
        defaults.setObject(veryHappyTip.text, forKey: "veryHappyTip")
        defaults.synchronize()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
