//
//  YKCustomButton.swift
//  Yogesh_Kohli_Assignment_3
//
//  Created by Yogesh Kohli on 9/28/17.
//  Copyright © 2017 Yogesh Kohli. All rights reserved.
//

import UIKit

class YKCustomButton: UIButton {

    var myValue: Int
    
    @IBInspectable var setRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = setRadius
        }
    }
    @IBInspectable var setBorderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = setBorderColor.cgColor
        }
        
    }
    @IBInspectable var setBorderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = setBorderWidth
        }
    }
    required init?(coder SAButtonDecoder: NSCoder) {
        self.myValue = 0
        super.init(coder: SAButtonDecoder)
        //self.layer.cornerRadius = 10
//        backgroundColor = UIColor.white
//        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.borderWidth = 1.0
//        self.layer.cornerRadius = 2.0
//        self.tintColor=UIColor.black
//        self.setTitleColor(UIColor.black, for: .normal)
    }
}
