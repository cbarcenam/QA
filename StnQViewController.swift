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
     
        let db = Firestore.firestore()
        
        db.collection("Updates").document("Statham")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    self.StnQAccessCode.text! = ("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.get("Code") else {
                    self.StnQAccessCode.text! = ("Document data was empty.")
                    return
                }
                self.StnQAccessCode.text! = (" \(data)")
        }
        
        db.collection("Updates").document("MountainQ")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    self.StnQDateLabel.text! = ("Error fetching document: \(error!)")
                    return
                }
                guard let date = document.get("Date") else {
                    self.StnQDateLabel.text! = ("Document data was empty.")
                    return
                }
                self.StnQDateLabel.text! = (" \(date)")
        }
        
    }
 
}
