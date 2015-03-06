//
//  ListViewController.swift
//  Scavenger Hunt
//
//  Created by Zach Perry on 3/5/15.
//  Copyright (c) 2015 Zach Perry. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let myManager = ItemsManager()
    
//    var itemsList =
//           [ScavengerHuntItem(name: "Cat"),
//            ScavengerHuntItem(name: "Bird"),
//            ScavengerHuntItem(name: "Brick")]
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addController = segue.sourceViewController as AddViewController
            if let newItem = addController.newItem {
                myManager.items += [newItem]
                myManager.save()
                let indexPath = NSIndexPath(forRow: myManager.items.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myManager.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        
        let item = myManager.items[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        if (item.isComplete) {
            cell.accessoryType = .Checkmark
            cell.imageView?.image = item.photo
        } else {
            cell.accessoryType = .None
            cell.imageView?.image = nil
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            imagePicker.sourceType = .Camera
        } else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        if let indexPath = tableView.indexPathForSelectedRow() {
            let selectedItem = myManager.items[indexPath.row]
            let photo = info[UIImagePickerControllerOriginalImage]
        as UIImage
            selectedItem.photo = photo
            dismissViewControllerAnimated(true, completion: {self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            })
        }
    }
}