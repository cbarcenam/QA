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
        
    let db = Firestore.firestore()
        
        //obtener objetos de un documento
        //https://firebase.google.com/docs/firestore/query-data/get-data#custom_objects
        
      /* to read data once
        let docRef = db.collection("Updates").document("MountainQ")
        
        docRef.getDocument(source: .cache) { (document, error) in
            if let document = document, document.exists {
                 //let property = document.get(code)
                 let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                self.MntnQAccessCode.text! = ("\(dataDescription)")
            }
            else {
               self.MntnQAccessCode.text! = ("----")
            }
        }
    */
    
        db.collection("Updates").document("MountainQ")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    self.MntnQAccessCode.text! = ("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.get("Code") else {
                    self.MntnQAccessCode.text! = ("Document data was empty.")
                    return
                }
              self.MntnQAccessCode.text! = (" \(data)")
        }
    
        db.collection("Updates").document("MountainQ")
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    self.MntnQDateLabel.text! = ("Error fetching document: \(error!)")
                    return
                }
                guard let date = document.get("Date") else {
                    self.MntnQDateLabel.text! = ("Document data was empty.")
                    return
                }
                self.MntnQDateLabel.text! = (" \(date)")
        }
        
    }
 
}
