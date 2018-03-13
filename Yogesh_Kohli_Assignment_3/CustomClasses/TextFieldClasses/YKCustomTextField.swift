//
//  YKCustomTextField.swift
//  Yogesh_Kohli_Assignment_3
//
//  Created by Yogesh Kohli on 9/28/17.
//  Copyright © 2017 Yogesh Kohli. All rights reserved.
//

import UIKit

class YKCustomTextField: UITextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.textColor = UIColor.black
        self.tintColor = UIColor.black
        self.backgroundColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 3.0
        self.layer.masksToBounds = true
    }
}
