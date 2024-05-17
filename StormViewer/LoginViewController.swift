//
//  LoginViewController.swift
//  StormViewer
//
//  Created by Huy on 17/5/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func oneButton(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "View") as? ViewController{
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
