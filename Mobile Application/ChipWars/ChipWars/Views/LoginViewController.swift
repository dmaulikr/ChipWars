//
//  LoginViewController.swift
//  ChipWars
//
//  Created by Makarov Andrey on 04/09/2017.
//  Copyright © 2017 Makarov Andrey. All rights reserved.
//
import UIKit

class LoginViewController: UIViewController {
    
    static let identifier = "LoginViewController"
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBAction func didTapLoginButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func Login() {
        CWAuthenticationManager.sharedManager.login(userName: userNameTextField.text!)
    }
}
