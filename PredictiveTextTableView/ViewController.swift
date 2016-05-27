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
    @IBOutlet weak var label: UILabel!
    
    var autoCompletePossibilities = ["Wand", "Wizard", "Test"]
    var autoComplete = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tempConvertToLowerCase()
        
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        
        
        textField.delegate = self
        textField.mainPageTextField()
        
        view.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tempConvertToLowerCase(){
        
        
        
        
        
        
        
        
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let substring = (textField.text!.lowercaseString as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        substring.lowercaseString
        
        searchAutocompleteEntriesWithSubstring(substring.lowercaseString)
        
        
        
        
        
        
        if textField == textField{
            let newText = range.length == 0 ? textField.text! + string : (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
            
            
            label.text = "It's \(newText)"
            
            if newText == "" {
                label.text = ""
            }
        }
 
        return true
        
    }
    
    
    
    
    func searchAutocompleteEntriesWithSubstring(substring: String) {
        
        
        autoComplete.removeAll(keepCapacity: false)
        
        for key in autoCompletePossibilities {
            
            
            
            
            let myString: NSString! = key.lowercaseString as NSString
            
            let substringRange :NSRange! = myString.rangeOfString(substring)
            
            if (substringRange.location  == 0) {
                autoComplete.append(key)
                }
            
            }
        
        tableView.reloadData()
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let index = indexPath.row as Int
        
        cell.textLabel!.text = autoComplete[index]
        
        
        
        cell.textLabel!.font = UIFont(name:"Helvetica", size: 24)
        cell.textLabel?.textAlignment = .Center
        cell.backgroundColor = UIColor(red: 25.0/255.0, green: 25.0/255.0, blue: 25.0/255.0, alpha: 1.0)
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        
        
        
        
        
        
        
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






