//
//  ViewController.swift
//  PredictiveTextTableView
//
//  Created by Matthew Howes Singleton on 5/26/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var autoCompletePossibilities = ["Wand", "Wizard", "Test"]
    var autoComplete = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        tableView.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let substring = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        searchAutocompleteEntriesWithSubstring(substring)
        
        return true
        
    }
    
    
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        autoComplete.removeAll(keepCapacity: false)
        
        for key in autoCompletePossibilities
        {
            let myString:NSString! = key as NSString
            
            let substringRange :NSRange! = myString.rangeOfString(substring)
            
            if (substringRange.location  == 0)
            {
                autoComplete.append(key)
            }
        }
        
        tableView.reloadData()
    }


    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let index = indexPath.row as Int
        
        cell.textLabel!.text = autoComplete[index]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return autoComplete.count
        
    }
    
    
    
    
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let selectedCell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        textField.text = selectedCell.textLabel!.text!
        
        
    }
    
    
    
    
    
    
    
    
    
    

}






