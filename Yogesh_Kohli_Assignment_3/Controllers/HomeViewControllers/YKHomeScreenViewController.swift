//
//  YKHomeScreenViewController.swift
//  Yogesh_Kohli_Assignment_3
//
//  Created by Yogesh Kohli on 9/28/17.
//  Copyright © 2017 Yogesh Kohli. All rights reserved.
//

import UIKit

class YKHomeScreenViewController: YKBaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var viewRed: UIView!
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var viewGreen: UIView!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var viewBlue: UIView!
    @IBOutlet weak var buttonColor: YKCustomButton!
    @IBOutlet weak var ViewColor: UIView!
    @IBOutlet weak var textFieldRed: YKCustomTextField!
    @IBOutlet weak var textFieldGreen: YKCustomTextField!
    @IBOutlet weak var textFieldBlue: YKCustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customiseUI()
        self.customNotification()
        self.addToolBarToKeyboard()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.allocation()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: UITextfield Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == self.textFieldRed {
            if textField.text?.count == 0 {
                DispatchQueue.main.async {
                    self.textFieldRed.text = "0"
                }
            }
            else {
                DispatchQueue.main.async {
                    self.sliderRed.value = Float(self.textFieldRed.text!)!
                    let defaults = UserDefaults.standard
                    defaults.set(self.sliderRed.value, forKey: "RED")
                }
            }
        }
        else if textField == self.textFieldGreen {
            if textField.text?.count == 0 {
                DispatchQueue.main.async {
                    self.textFieldGreen.text = "0"
                }
            }
            else {
                DispatchQueue.main.async {
                    self.sliderGreen.value = Float(self.textFieldGreen.text!)!
                    let defaults = UserDefaults.standard
                    defaults.set(self.sliderGreen.value, forKey: "GREEN")
                }
            }
            
        }
        else {
            if textField.text?.count == 0 {
                DispatchQueue.main.async {
                    self.textFieldBlue.text = "0"
                }
            }
            else {
                DispatchQueue.main.async {
                    self.sliderBlue.value = Float(self.textFieldBlue.text!)!
                    let defaults = UserDefaults.standard
                    defaults.set(self.sliderBlue.value, forKey: "BLUE")
                }
            }
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.textFieldRed {
            self.textFieldGreen.becomeFirstResponder()
        }
        else if textField == self.textFieldGreen {
            self.textFieldBlue.becomeFirstResponder()
        }
        else{
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //Red textfield
        if textField == self.textFieldRed {
            let text = self.textFieldRed.text! as NSString
            let textAfterUpdate = text.replacingCharacters(in: range, with: string)
            if let temp = Int(textAfterUpdate) {
                if temp > 100 || temp < 0 {
                    return false
                }
                else if let temporary =  Int(text as String) {
                    if temporary == 0 {
                        DispatchQueue.main.async {
                            self.textFieldRed.text = string
                        }
                        return true
                    }
                    else {
                        return true
                    }
                }
                else {
                    return true
                }
            }
            else {
                if textAfterUpdate.count == 0 {
                    DispatchQueue.main.async {
                        self.textFieldRed.text = "0"
                    }
                    return true
                }
                else {
                    return false
                }
                
            }
        }
            //Green textfield
        else  if textField == self.textFieldGreen {
            let text = self.textFieldGreen.text! as NSString
            let textAfterUpdate = text.replacingCharacters(in: range, with: string)
            if let temp = Int(textAfterUpdate) {
                if temp > 100 || temp < 0 {
                    return false
                }
                else if let temporary =  Int(text as String) {
                    if temporary == 0 {
                        DispatchQueue.main.async {
                            self.textFieldGreen.text = string
                        }
                        return true
                    }
                    else {
                        return true
                    }
                }
                else {
                    return true
                }
            }
            else {
                if textAfterUpdate.count == 0 {
                    DispatchQueue.main.async {
                        self.textFieldGreen.text = "0"
                    }
                    return true
                }
                else {
                    return false
                }
                
            }
        }
            //Blue textfield
        else {
            let text = self.textFieldBlue.text! as NSString
            let textAfterUpdate = text.replacingCharacters(in: range, with: string)
            if let temp = Int(textAfterUpdate) {
                if temp > 100 || temp < 0 {
                    return false
                }
                else if let temporary =  Int(text as String) {
                    if temporary == 0 {
                        DispatchQueue.main.async {
                            self.textFieldBlue.text = string
                        }
                        return true
                    }
                    else {
                        return true
                    }
                }
                else {
                    return true
                }
            }
            else {
                if textAfterUpdate.count == 0 {
                    DispatchQueue.main.async {
                        self.textFieldBlue.text = "0"
                    }
                    return true
                }
                else {
                    return false
                }
                
            }
        }
    }
    
    //MARK: Private Methods
    func customNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicatonDidEnterBackground(_:)), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
    }
    @objc func applicatonDidEnterBackground(_ notification:NSNotification) {
        DispatchQueue.main.async {
            let defaults = UserDefaults.standard
            defaults.set(self.getRedPercentage(), forKey: "RED")
            defaults.set(self.getGreenPercentage(), forKey: "GREEN")
            defaults.set(self.getBluePercentage(), forKey: "BLUE")
            self.sliderRed.value = Float(self.getRedPercentage())
            self.sliderGreen.value = Float(self.getGreenPercentage())
            self.sliderBlue.value = Float(self.getBluePercentage())
        }
    }
    func getRedPercentage() -> Int {
        if let temp = Int(self.textFieldRed.text!) {
            return temp
        }
        else {
            return 0
        }
    }
    func getGreenPercentage() -> Int {
        if let temp = Int(self.textFieldGreen.text!) {
            return temp
        }
        else {
            return 0
        }
    }
    
    func getBluePercentage() -> Int {
        if let temp = Int(self.textFieldBlue.text!) {
            return temp
        }
        else {
            return 0
        }
    }
    
    func customiseUI() -> Void {
        self.viewRed.backgroundColor = UIColor.clear
        self.viewGreen.backgroundColor = UIColor.clear
        self.viewBlue.backgroundColor = UIColor.clear
        self.ViewColor.layer.cornerRadius = 5.0
        self.ViewColor.layer.masksToBounds = true
    }
    
    func addToolBarToKeyboard() -> Void {
        let numberToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        numberToolbar.barStyle = UIBarStyle.default
        numberToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.doneNumberPad))]
        numberToolbar.sizeToFit()
        self.textFieldBlue.inputAccessoryView = numberToolbar
        self.textFieldGreen.inputAccessoryView = numberToolbar
        self.textFieldRed.inputAccessoryView = numberToolbar
    }
    //done tool bar button action
    @objc func doneNumberPad() {
        self.textFieldBlue.resignFirstResponder()
        self.textFieldGreen.resignFirstResponder()
        self.textFieldRed.resignFirstResponder()
    }
    
    func allocation() -> Void {
        self.navigationController?.isNavigationBarHidden = false
        let defaults = UserDefaults.standard
        if let storedRed = defaults.object(forKey: "RED"), let storedGreen = defaults.object(forKey: "GREEN"), let storedBlue = defaults.object(forKey: "BLUE") {
            let temporaryRed : Int = storedRed as! Int
            let temporaryGreen : Int = storedGreen as! Int
            let temporaryBlue : Int = storedBlue as! Int
            DispatchQueue.main.async {
                self.textFieldRed.text = String(describing: storedRed)
                self.textFieldGreen.text = String(describing: storedGreen)
                self.textFieldBlue.text = String(describing: storedBlue)
                self.sliderRed.value = Float(temporaryRed)
                self.sliderGreen.value = Float(temporaryGreen)
                self.sliderBlue.value = Float(temporaryBlue)
                let tempColor : UIColor =   defaults.color(forKey: "COLOR")!
                self.ViewColor.backgroundColor = tempColor
            }
        }
        else {
            //Default is Black Background - which means R = 0 ; G = 0 ; B = 0
            DispatchQueue.main.async {
                self.textFieldRed.text = "0"
                self.textFieldGreen.text = "0"
                self.textFieldBlue.text = "0"
                self.sliderRed.value = 0.0
                self.sliderGreen.value = 0.0
                self.sliderBlue.value = 0.0
                let defaults = UserDefaults.standard
                defaults.set("0", forKey: "RED")
                defaults.set("0", forKey: "GREEN")
                defaults.set("0", forKey: "BLUE")
                defaults.set(UIColor.black, forKey: "COLOR")
                if let colorStored = defaults.color(forKey: "COLOR") {
                    self.ViewColor.backgroundColor = colorStored
                }
                else{
                    self.ViewColor.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
                }
                
            }
        }
    }
    
    func updateViewColor() {
        DispatchQueue.main.async {
            let defaults = UserDefaults.standard
            defaults.set(self.getRedPercentage(), forKey: "RED")
            defaults.set(self.getGreenPercentage(), forKey: "GREEN")
            defaults.set(self.getBluePercentage(), forKey: "BLUE")
            self.sliderRed.value = Float(self.getRedPercentage())
            self.sliderGreen.value = Float(self.getGreenPercentage())
            self.sliderBlue.value = Float(self.getBluePercentage())
            self.ViewColor.backgroundColor = UIColor.init(red: CGFloat((Float(self.getRedPercentage()*255)/100)/255.0), green: CGFloat((Float(self.getGreenPercentage()*255)/100)/255.0), blue: CGFloat((Float(self.getBluePercentage()*255)/100)/255.0), alpha: 1.0)
            defaults.set(UIColor.init(red: CGFloat((Float(self.getRedPercentage()*255)/100)/255.0), green: CGFloat((Float(self.getGreenPercentage()*255)/100)/255.0), blue: CGFloat((Float(self.getBluePercentage()*255)/100)/255.0), alpha: 1.0), forKey: "COLOR")
        }
    }
    
    func buttonColorAction () -> Void {
        //Checking whether field is empty or not
        if self.textFieldRed.text?.count != 0 && self.textFieldGreen.text?.count != 0 && self.textFieldBlue.text?.count != 0 {
            self.doneNumberPad()
            //optionals unwrapping
            if let _ = Int(self.textFieldRed.text!), let _ = Int(self.textFieldGreen.text!), let _ = Int(self.textFieldBlue.text!) {
                //Check whether percentage is more than 100 or not
                if   self.getRedPercentage() > 100 || self.getGreenPercentage() > 100 || self.getBluePercentage() > 100 || self.getRedPercentage() < 0 || self.getGreenPercentage() < 0 || self.getBluePercentage() < 0 {
                    let tempMessage = "Invalid Inputs! Please between 0 to 100!"
                    self.alertMessage(tempMessage)
                }
                    //All percentages are okay - not more than 100 - so can call update view color method
                else{
                    self.updateViewColor()
                }
            }
                //Any of Textfield is empty - so invalid input - show him an alert that please enter valid one!
            else {
                let tempMessage = "Invalid Inputs!"
                self.alertMessage(tempMessage)
            }
        }
            //Field is/are empty
        else{
            let tempMessage = "Invalid Inputs! Field cannot be empty!"
            self.alertMessage(tempMessage)
        }
    }
    
    //MARK: UIButton Actions
    @IBAction func buttonColorPressed(_ sender: Any) {
        self.buttonColorAction()
    }
    
    //MARK: UISlider Actions
    @IBAction func sliderRedChanged(_ sender: Any) {
        DispatchQueue.main.async {
            self.doneNumberPad()
            self.textFieldRed.text = String(Int(self.sliderRed.value))
            self.updateViewColor()
        }
    }
    @IBAction func sliderGreenChanged(_ sender: Any) {
        DispatchQueue.main.async {
            self.doneNumberPad()
            self.textFieldGreen.text = String(Int(self.sliderGreen.value))
            self.updateViewColor()
        }
    }
    @IBAction func sliderBlueChanged(_ sender: Any) {
        DispatchQueue.main.async {
            self.doneNumberPad()
            self.textFieldBlue.text = String(Int(self.sliderBlue.value))
            self.updateViewColor()
        }
    }
}
//Extending UserDefaults
extension UserDefaults {
    func set(_ color: UIColor, forKey key: String){
        set(NSKeyedArchiver.archivedData(withRootObject: color), forKey: key)
    }
    func color(forKey key: String) -> UIColor? {
        guard let data = data(forKey: key) else {
            return nil
        }
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? UIColor
    }
}

