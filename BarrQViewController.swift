//
//  BarrQViewController.swift
//  QA
//
//  Created by Caro Barcena on 9/27/19.
//  Copyright © 2019 Caro Barcena. All rights reserved.
//

import UIKit
import Firebase

class BarrQViewController: UIViewController {
    
    @IBOutlet weak var BarrQBack: UIButton!
    @IBOutlet weak var BarrQTitleLabel: UILabel!
    @IBOutlet weak var BarrQAccessLabel: UILabel!
    @IBOutlet weak var BarrQAccessCode: UILabel!
    @IBOutlet weak var BarrQDateLabel: UILabel!
    @IBOutlet weak var BarrQUpdateButton: UIButton!
    

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
