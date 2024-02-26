//
//  LoginVC.swift
//  SampleTraningApp
//
//  Created by Shubham Naidu on 28/11/23.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var userIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButtonX!
    @IBOutlet weak var loggedInUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        updateView()
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        if !isUserLoggedIn() {
                guard let username = userIdTextField.text else {
                    return
                }
                loggedInUserLabel.text = "Welcome \(username), to the Shopping festival..!!"
                UserDefaults.standard.set(username, forKey: "cuid")
                UserDefaults.standard.synchronize()
            } else {
                UserDefaults.standard.removeObject(forKey: "cuid")
                UserDefaults.standard.synchronize()
            }
            updateView()
    }
    
    func isUserLoggedIn() -> Bool {
        return UserDefaults.standard.string(forKey: "cuid") != nil
    }
    
    func updateView(){
        if isUserLoggedIn() {
            loggedInUserLabel.isHidden = false
            userIdTextField.isHidden = true
            passwordTextField.isHidden = true
            loginButton.setTitle("Logout", for: .normal)
            if let cuid = UserDefaults.standard.string(forKey: "cuid") as? String{
                loggedInUserLabel.text = "Welcome \(cuid), to the Shopping festival..!!"
            }
        } else{
            loggedInUserLabel.isHidden = true
            userIdTextField.isHidden = false
            passwordTextField.isHidden = false
            loginButton.setTitle("Login", for: .normal)
        }
    }

}
