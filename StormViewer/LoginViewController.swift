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
        
        let loginJSON = UserLoginModel(email: emailField.text ?? "", password: passwordField.text ?? "")
        
        
//        if(!Validator.isValidEmail(for: loginJSON.email)){
//            print("Email not valid")
//            return
//        }
//        
//        if(!Validator.isPasswordValid(for: loginJSON.password)){
//            print("Password not valid")
//            return
//        }
        
        guard let request = Endpoint.login(userModel: loginJSON).request else { return }
        
        
        let auth = AuthService()
        
        auth.login(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case.success(_):
                print(auth.accessToken)
                print(auth.refreshToken)
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "View") as? ViewController{
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
                break
            case.failure(let error):
                guard let error = error as? ServiceError else{return}
                
                switch error{
                case .serverError(let string),
                        .unknown(let string),
                        .decodingError(let string):
                    print(string)
                    
                }
                
            }
            
        }
        
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
