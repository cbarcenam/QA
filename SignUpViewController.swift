//
//  SignUpViewController.swift
//  QA
//
//  Created by Caro Barcena on 9/27/19.
//  Copyright © 2019 Caro Barcena. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var FirstNameTextFielf: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PaswordTextField: UITextField!
    @IBOutlet weak var PhoneTextField: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var SignUpErrorLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     setUpElements()
    }
    
    func setUpElements() {
        //Hide the error Label 
        SignUpErrorLabel.alpha = 0
        
    }
    
    /*
     Check the fields and validate that the data is correct. If everything is correct this method returns nill. Othewise,
     it returns the error message as a string
     */
    
    func validateFields() -> String? {
        
        //Check that all fields are filled in.
        if FirstNameTextFielf.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PaswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PhoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
         /*
         //Check if the password is secure
        let cleanedPassword = PaswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
          return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
         */
 
        return nil
    }
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
        // Validate the fields
        let error = validateFields()
        if error != nil {
            // there's something wrong witht he fields, show errro message
            showError(error!)
        }
        else {
            // Create clean versions of the data
            let firstName = FirstNameTextFielf.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = LastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PaswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phone = PhoneTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //check for errors
                if err != nil {
                    // there was an error creating the user
                    self.showError("Error creating user.")
                }
                else {
                    // user was created successfully, now store the remaining data
                   let db = Firestore.firestore()
                
                    db.collection("users").addDocument(data: ["firstname":firstName, "Lastname":lastName, "phone":phone, "uid": result!.user.uid ]) { (error) in
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data.")
                        }
                    }
                      // Transition to the Homescreen
                    self.transitionToHome()
                }
            }
        }
      
    }
    
    func showError(_ message : String) {
        SignUpErrorLabel.text = message
        SignUpErrorLabel.alpha = 1
    }
    
    func transitionToHome () {
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
