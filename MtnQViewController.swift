//
//  MtnQViewController.swift
//  QA
//
//  Created by Caro Barcena on 9/27/19.
//  Copyright © 2019 Caro Barcena. All rights reserved.
//

import UIKit
import Firebase

class MtnQViewController: UIViewController {
    
    @IBOutlet weak var MntnQBack: UIButton!
    @IBOutlet weak var MountainQLabel: UILabel!
    @IBOutlet weak var MntnQAccessLabel: UILabel!
    @IBOutlet weak var MntnQAccessCode: UILabel!
    @IBOutlet weak var MntnQDateLabel: UILabel!
    @IBOutlet weak var MntnQUpdateButton: UIButton!
    

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
