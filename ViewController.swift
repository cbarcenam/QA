//
//  ViewController.swift
//  QA
//
//  Created by Caro Barcena on 9/27/19.
//  Copyright © 2019 Caro Barcena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var StartTitleLabel: UILabel!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var SignupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        LoginButton.layer.cornerRadius =  25.0
        SignupButton.layer.cornerRadius = 25.0 
    
    }


}

