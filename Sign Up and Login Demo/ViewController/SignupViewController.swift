//
//  SignupViewController.swift
//  Sign Up and Login Demo
//
//  Created by Sheraz Hussain on 10/11/2021.
//  Copyright © 2021 Sheraz Hussain. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
      @IBOutlet weak var nameTxtField: UITextField!
      @IBOutlet weak var emailTxtField: UITextField!
      @IBOutlet weak var dBirthTxtField: UITextField!
      @IBOutlet weak var mobileTxtField: UITextField!
      @IBOutlet weak var pswdTxtField: UITextField!
      @IBOutlet weak var cPswdTxtField: UITextField!
    
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       initial()
      createDatePicker()
      textFiledDesign()
        // Do any additional setup after loading the view.
    }
    
     func initial()

           {

           self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))

           // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to show

           NotificationCenter.default.addObserver(self, selector:#selector(SignupViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

           // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden

            NotificationCenter.default.addObserver(self, selector: #selector(SignupViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
            
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
                   else if cPswd != pswd {
                    alertMsg(alert: "Password not matched")
                    
                   }
                   
                   else {
                       let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                              navigationController?.pushViewController(vc, animated: true)
                      
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
               
               func createDatePicker()

               {

               //toolbar

               let toolbar = UIToolbar()

               toolbar.sizeToFit()

               //bar button

               let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))

               toolbar.setItems([doneBtn], animated: true)

               // assign toolbar

               dBirthTxtField.inputAccessoryView = toolbar

               //assign date picker to txt field

               dBirthTxtField.inputView = datePicker

               //date picker mode

               datePicker.datePickerMode = .date

               }

               //function called when 'done' button pressed from UI

               @objc func donePressed()

               {

               //formatting the date

               let formatter = DateFormatter()

               formatter.dateStyle = .medium

               formatter.timeStyle = .none

               //parsing the date into fields

               dBirthTxtField.text = formatter.string(from: datePicker.date)

               self.view.endEditing(true)

               }
    
    func textFiledDesign()
        {
            let name = nameTxtField
            let email = emailTxtField
            let dBirth = dBirthTxtField
            let mobile = mobileTxtField
            let pswd = pswdTxtField
            let cPswd = cPswdTxtField
            
            
            name?.layer.cornerRadius = 25
            name?.layer.masksToBounds = true
            name?.layer.borderColor = UIColor.black.cgColor
            name?.layer.borderWidth = 1.0
            
            email?.layer.cornerRadius = 25
            email?.layer.masksToBounds = true
            email?.layer.borderColor = UIColor.black.cgColor
            email?.layer.borderWidth = 1.0
            
            dBirth?.layer.cornerRadius = 25
            dBirth?.layer.masksToBounds = true
            dBirth?.layer.borderColor = UIColor.black.cgColor
            dBirth?.layer.borderWidth = 1.0
            
            mobile?.layer.cornerRadius = 25
            mobile?.layer.masksToBounds = true
            mobile?.layer.borderColor = UIColor.black.cgColor
            mobile?.layer.borderWidth = 1.0
            
            pswd?.layer.cornerRadius = 25
            pswd?.layer.masksToBounds = true
            pswd?.layer.borderColor = UIColor.black.cgColor
            pswd?.layer.borderWidth = 1.0
            
            cPswd?.layer.cornerRadius = 25
            cPswd?.layer.masksToBounds = true
            cPswd?.layer.borderColor = UIColor.black.cgColor
            cPswd?.layer.borderWidth = 1.0
               
           }

          //function called when keyboard is about to show

          @objc func keyboardWillShow(notification: NSNotification) {

          guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {

          // if keyboard size is not available for some reason, dont do anything

          return

          }

          // move the root view up by the distance of keyboard height

          self.view.frame.origin.y = 0 - keyboardSize.height + 250

          }

          //function called when keyboard is about to hide

          @objc func keyboardWillHide(notification: NSNotification) {

          // move back the root view origin to zero

          self.view.frame.origin.y = 0

          }

          //function to hide keyboard on press

          @objc private func hideKeyboard()

          {

          self.view.endEditing(true)

          }
    
    
   }
