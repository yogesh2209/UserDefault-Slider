//
//  YKMainViewController.swift
//  Yogesh_Kohli_Assignment_3
//
//  Created by Yogesh Kohli on 9/28/17.
//  Copyright © 2017 Yogesh Kohli. All rights reserved.
//

import UIKit

class YKMainViewController: YKBaseViewController {

    //MARK: Property Declarations
    @IBOutlet weak var buttonGetStarted: YKCustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: UIButton Actions
    
    @IBAction func buttonGetStartedPressed(_ sender: Any) {
        performSegue(withIdentifier: "mainScreenToHomeScreenSegueVC", sender: nil)
    }
}
