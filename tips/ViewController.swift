//
//  ViewController.swift
//  tips
//
//  Created by fai k on 12/10/15.
//  Copyright © 2015 fai k. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        if (defaults.doubleForKey("firstSeg") == 0) {
        defaults.setDouble(0.18, forKey: "firstSeg")
        defaults.setDouble(0.20, forKey: "secondSeg")
        defaults.setDouble(0.22, forKey: "thirdSeg")
        defaults.synchronize()
            
        
        }
        
        var a = defaults.doubleForKey("firstSeg") * 100
        var b = String(format:"%.0f%%", a)
        
        segmentControl.setTitle(b, forSegmentAtIndex: 0)
        
        a = defaults.doubleForKey("secondSeg") * 100
        b = String(format:"%.0f%%", a)
        
        segmentControl.setTitle(b, forSegmentAtIndex: 1)
        
        a = defaults.doubleForKey("thirdSeg") * 100
        b = String(format:"%.0f%%", a)
        
        segmentControl.setTitle(b, forSegmentAtIndex: 2)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let segOne = defaults.doubleForKey("firstSeg")
        let segTwo = defaults.doubleForKey("secondSeg")
        let segThree = defaults.doubleForKey("thirdSeg")
        
        //var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentages = [segOne, segTwo, segThree]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
    
        var billAmount = NSString(string: billField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

