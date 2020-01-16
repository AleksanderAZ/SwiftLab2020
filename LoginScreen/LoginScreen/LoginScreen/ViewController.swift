//
//  ViewController.swift
//  LoginScreen
//
//  Created by Z on 1/15/20.
//  Copyright © 2020 Zyma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTextFild: UITextField!
    @IBOutlet weak var passwordTextFild: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    var flagChechLogin = false
    var flagChechPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.isEnabled = false
    }
    
    @IBAction func changedLoginTextField(_ sender: UITextField) {
        print(11)
        guard let login = sender.text else { return }
        checkLogin(login: login)
    }
    
    @IBAction func changedPasswordTextField(_ sender: UITextField) {
        print(1)
        guard let password = sender.text else { return }
        checkPassword(password: password)
    }
    
    @IBAction func clickLoginButton(_ sender: UIButton) {
        
    }
    
    @IBAction func clickLinkButton(_ sender: UIButton) {
        
    }
    
   

    func checkLogin(login: String) {
        print(12)
        flagChechLogin = false
        let count = login.count
        guard (count > 4 && count < 26 ) else {
            switchOffLoginButton()
            return
        }
        print(13)
        guard login.contains("@") else {
            switchOffLoginButton()
            return
        }

        print(14)
        let special_characters = " \"'()+,-/:;<=>?[\\]_`{|}~"
        for char in special_characters {
            if login.contains(char) {
                switchOffLoginButton()
                return
            }
        }
        print(15)
        var loginChar = Array(login)
        var index = loginChar.lastIndex(of: ".")
        guard index != nil else {
            switchOffLoginButton()
            return
        }
        print(16)
        while (index != nil) {
            guard (index! < loginChar.count - 2) else {
                switchOffLoginButton()
                return
            }
            loginChar.removeLast(loginChar.count-index!)
            index = loginChar.lastIndex(of: ".")
        }
        print(17)
        flagChechLogin = true
        switchOnLoginButton()
    }
    
    func checkPassword(password: String) {
        print(2)
        flagChechPassword = false
        let count = password.count
        guard (count > 4 && count < 21 ) else {
            switchOffLoginButton()
            return
        }
        print(3)
        let numbers = "0123456789"
        let lower_case = "abcdefghijklmnopqrstuvwxyz"
        let upper_case = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let special_characters = "!@#$%^&*()-+"
        let checkingStrings = [numbers, lower_case, upper_case, special_characters]

        for check in checkingStrings {
            var checkFlag = false
            for char in check {
                if password.contains(char) {
                    checkFlag = true
                    break
                }
            }
            guard (checkFlag) else {
                switchOffLoginButton()
                return
            }
        }
        print(4)
        flagChechPassword = true
        switchOnLoginButton()
    }

    func switchOffLoginButton() {
        loginButton.isEnabled = false
    }
    
    func switchOnLoginButton() {
        print(5)
        if (flagChechLogin && flagChechPassword) {
            print(6)
            loginButton.isEnabled = true
        }
    }
}

