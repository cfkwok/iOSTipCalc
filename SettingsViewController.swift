//
//  SettingsViewController.swift
//  tips
//
//  Created by fai k on 12/10/15.
//  Copyright © 2015 fai k. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var tipBox1: UITextField!
    
    @IBOutlet weak var tipBox2: UITextField!

    @IBOutlet weak var tipBox3: UITextField!
    
let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func onEditBox1(sender: AnyObject) {
        var newFirst = NSString(string: tipBox1.text!).doubleValue
        defaults.setDouble(newFirst, forKey: "firstSeg")
    }
    
    
    @IBAction func onEditBox2(sender: AnyObject) {
        var newSecond = NSString(string: tipBox2.text!).doubleValue
        defaults.setDouble(newSecond, forKey: "secondSeg")
    }
    

    @IBAction func onEditBox3(sender: AnyObject) {
        var newThird = NSString(string: tipBox3.text!).doubleValue
        defaults.setDouble(newThird, forKey: "thirdSeg")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
