//
//  General+Extension.swift
//  PredictiveTextTableView
//
//  Created by Matthew Howes Singleton on 5/26/16.
//  Copyright © 2016 Matthew Howes Singleton. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    
    func mainPageTextField(){
        
        layer.masksToBounds = true
        layer.cornerRadius = 21
        autocorrectionType = UITextAutocorrectionType.No
        keyboardAppearance = UIKeyboardAppearance.Dark
        backgroundColor = UIColor.darkGrayColor()
        textAlignment = .Center
        textColor = UIColor.whiteColor()
        
        
    }
    
    
    
}