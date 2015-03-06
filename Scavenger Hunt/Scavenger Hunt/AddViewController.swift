//
//  AddViewController.swift
//  Scavenger Hunt
//
//  Created by Zach Perry on 3/5/15.
//  Copyright (c) 2015 Zach Perry. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var newItem: ScavengerHuntItem?
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
            if let name = textField.text {
                if !name.isEmpty {
                    newItem = ScavengerHuntItem(name: name)
                }
            }
        }
    }
    
    @IBAction func Cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

