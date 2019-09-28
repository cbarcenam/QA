//
//  StnQViewController.swift
//  QA
//
//  Created by Caro Barcena on 9/27/19.
//  Copyright © 2019 Caro Barcena. All rights reserved.
//

import UIKit
import Firebase

class StnQViewController: UIViewController {

    @IBOutlet weak var StnQBack: UIButton!
    @IBOutlet weak var StnQTitleLabel: UILabel!
    @IBOutlet weak var StnQAccessLabel: UILabel!
    @IBOutlet weak var StnQAccessCode: UILabel!
    @IBOutlet weak var StnQDateLabel: UILabel!
    @IBOutlet weak var StnQUpdateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     let db = Firestore.firestore()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
