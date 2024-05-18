//
//  LoginViewController.swift
//  StormViewer
//
//  Created by Huy on 17/5/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var emailField : UITextField!
    @IBOutlet var passwordField : UITextField!

    @IBAction func oneButton(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "View") as? ViewController{
            navigationController?.pushViewController(vc, animated: true)
        }
        print(emailField.text!)
        print(passwordField.text!)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.returnKeyType = .done
        emailField.autocorrectionType = .no
        emailField.autocapitalizationType = .none
        emailField.delegate = self
        
        
        passwordField.returnKeyType = .done
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        passwordField.delegate = self
        passwordField.isSecureTextEntry = true
    }
    
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
