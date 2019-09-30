//
//  UpdateViewController.swift
//  QA
//
//  Created by Caro Barcena on 9/27/19.
//  Copyright © 2019 Caro Barcena. All rights reserved.
//

import UIKit
import Firebase

class UpdateViewController: UIViewController {
    
    
    @IBOutlet weak var UpdateBackButton: UIButton!
    @IBOutlet weak var UpdateAreaLabel: UILabel!
    @IBOutlet weak var UpdateAreaText: UITextField!
    @IBOutlet weak var UpdateCodeLabel: UILabel!
    @IBOutlet weak var UpdateCodeProposal: UITextField!
    @IBOutlet weak var UpdateSubmitButton: UIButton!
    @IBOutlet weak var UpdateErrorLabel: UILabel!
    @IBOutlet weak var UpdateSuccessLabel: UILabel!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        //Hide the error Label
        UpdateErrorLabel.alpha = 0
        UpdateSuccessLabel.alpha = 0
        
    }

    func validateFields() -> String? {
        
        //Check that all fields are filled in.
        if UpdateAreaText.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            UpdateCodeProposal.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        return nil
    }
    
    
    @IBAction func SubmitPushed(_ sender: Any) {
        // Validate the fields
        let error = validateFields()
        if error != nil {
            // there's something wrong witht he fields, show errro message
        }
        else {
            // Create clean versions of the data
        let quarry = UpdateAreaText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let code = UpdateCodeProposal.text!.trimmingCharacters(in: .whitespacesAndNewlines)
       
    
        let db = Firestore.firestore()
        // Adding a document
        // See: https://firebase.google.com/docs/firestore/manage-data/add-data
        db.collection("Access Code").addDocument(data: ["Area" : quarry, "Access Code" : code, "Date" : Date()])
        }
        if error != nil {
            // then  could'nt sign in
            self.UpdateErrorLabel.text = "Data not saved. Try again later."
            self.UpdateErrorLabel.alpha = 1
        }
        else {
            self.UpdateSuccessLabel.text = "Data saved succesfully!"
            self.UpdateSuccessLabel.alpha = 1
        }
    }
}

