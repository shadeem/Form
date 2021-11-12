//
//  SignViewController.swift
//  Sign Up and Login Demo
//
//  Created by Sheraz Hussain on 10/11/2021.
//  Copyright © 2021 Sheraz Hussain. All rights reserved.
//

import UIKit

class SignViewController: UITableViewController {
    
   @IBOutlet weak var nameTxtField: UITextField!
   
   @IBOutlet weak var emailTxtField: UITextField!
   
   @IBOutlet weak var dBirthTxtField: UITextField!
   @IBOutlet weak var mobileTxtField: UITextField!
   @IBOutlet weak var pswdTxtField: UITextField!
   @IBOutlet weak var cPswdTxtField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    @IBAction func signUpBtn(_ sender: Any) {
               
               let name = nameTxtField.text
               let email = emailTxtField.text
               let dBirth = dBirthTxtField.text
               let mobile = mobileTxtField.text
               let pswd = pswdTxtField.text
               let cPswd = cPswdTxtField.text
               
               if name == "" || email == "" || dBirth == "" || mobile == "" || pswd == "" || cPswd == "" {
                   alertMsg(alert: "Please fill the field")
                   
                   
               }
               else if validateEmail(candidate: email!) == false {
               
                   alertMsg(alert: "Your email is not valid,Your email must have @")
               }
               
               else {
                   
                  
               }
           
           

       }
           func alertMsg(alert: String) {
               let alert = UIAlertController(title: "My alert", message: alert, preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
               NSLog("The \"OK\" alert occured.")
               }))
                self.present(alert, animated: true, completion: nil)
               
           }
           
           func validateEmail(candidate: String) -> Bool {
               let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
               return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
           }
           
           
           
       }


}
