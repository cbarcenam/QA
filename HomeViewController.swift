//
//  HomeViewController.swift
//  QA
//
//  Created by Caro Barcena on 9/27/19.
//  Copyright © 2019 Caro Barcena. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

   
    @IBOutlet weak var LogoutButton: UIButton!
    @IBOutlet weak var HomeTitleLabel: UILabel!
    @IBOutlet weak var MntnQButton: UIButton!
    @IBOutlet weak var StnQButton: UIButton!
    @IBOutlet weak var BarrQButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func LogOutPushed(_ sender: Any) {
    }
    
}
