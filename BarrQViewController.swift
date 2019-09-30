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
        let db = Firestore.firestore()
        
        db.collection("Updates").document("Barrington")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    self.BarrQAccessCode.text! = ("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.get("Code") else {
                    self.BarrQAccessCode.text! = ("Document data was empty.")
                    return
                }
                self.BarrQAccessCode.text! = (" \(data)")
        }
        
        db.collection("Updates").document("MountainQ")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    self.BarrQDateLabel.text! = ("Error fetching document: \(error!)")
                    return
                }
                guard let date = document.get("Date") else {
                    self.BarrQDateLabel.text! = ("Document data was empty.")
                    return
                }
                self.BarrQDateLabel.text! = (" \(date)")
        }
    }

   

}
