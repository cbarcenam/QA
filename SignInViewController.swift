//
//  SignInViewController.swift
//  QA
//
//  Created by Caro Barcena on 9/27/19.
//  Copyright © 2019 Caro Barcena. All rights reserved.
//

import UIKit
import Firebase


class SignInViewController: UIViewController {

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var LoginErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
         //hide the error label
        LoginErrorLabel.alpha = 0

    }

    @IBAction func LoginButtonPressed(_ sender: Any) {
        // Validate the Text fields
        
        // Create clean versions of the text field
        let email = UsernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        // Sign in user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // then  could'nt sign in
                self.LoginErrorLabel.text = error!.localizedDescription
                self.LoginErrorLabel.alpha = 1
            }
            else {
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
}
