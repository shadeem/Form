//
//  ViewController.swift
//  Sign Up and Login Demo
//
//  Created by Sheraz Hussain on 09/11/2021.
//  Copyright © 2021 Sheraz Hussain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFiledDesign()
        // Do any additional setup after loading the view.
    }
    @IBAction func createOne(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func loginBtn(_ sender: Any) {
        
        let emailtxt = emailTxtField.text
        let passwordTxt = passwordTxtField.text
        
        if emailtxt == "" || passwordTxt == "" {
        alertMsg(alert: "Please fill the field")
      }
        else if validateEmail(candidate: emailtxt!) == false {
             alertMsg(alert: "Your email must have @")
        }
        else {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
                navigationController?.pushViewController(vc, animated: true)
        
         alertMsg(alert: "Login Success")
        }
    }
    
    func textFiledDesign()
       {
           emailTxtField.layer.cornerRadius = 25
           emailTxtField.layer.masksToBounds = true
           emailTxtField.layer.borderColor = UIColor.black.cgColor
           emailTxtField.layer.borderWidth = 1.0
           
           passwordTxtField.layer.cornerRadius = 25
           passwordTxtField.layer.masksToBounds = true
           passwordTxtField.layer.borderColor = UIColor.black.cgColor
           passwordTxtField.layer.borderWidth = 1.0
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
  
