//
//
// RegisterForm.swift
//
// Created by Ringo Müller-Gromes on 31.07.20.
// Copyright © 2020 Ringo Müller-Gromes. All rights reserved.
//

import UIKit

class RegisterForm : UIView{
  
  /**
   ISSUE: if one of the textfields set to .password or .newPassword
   on console this appears:
   2020-07-31 11:37:09.232014+0200 iOS Demo[11563:338678] [AutoFill] Cannot show Automatic Strong Passwords for app bundleID: de.ios.demo.2020.iOS-Demo due to error: iCloud Keychain is disabled
   
   and keyboard is in english now!
   
   
   https://stackoverflow.com/questions/52770550/set-a-passwordfield-to-securetextentry-give-me-a-strange-behaviour
   https://stackoverflow.com/questions/52701160/native-uitextfield-secure-text-entry-forces-english-us-keyboard
   
   */
  
  let mailInput = UITextField()
  let passwordInput = UITextField()
  let passwordInput2 = UITextField()
  let nameInput = UITextField()
  let label = UILabel()
  let button = UIButton()
  
  // MARK: init
  public override init(frame: CGRect){
    super.init(frame: frame)
    
    nameInput.layer.borderColor = UIColor.lightGray.cgColor
    mailInput.layer.borderColor = UIColor.lightGray.cgColor
    passwordInput.layer.borderColor = UIColor.lightGray.cgColor
    passwordInput2.layer.borderColor = UIColor.lightGray.cgColor
    
    nameInput.layer.borderWidth = 0.5
    mailInput.layer.borderWidth = 0.5
    passwordInput.layer.borderWidth = 0.5
    passwordInput2.layer.borderWidth = 0.5
    
    //    passwordInput.textContentType = .password
    //    passwordInput2.textContentType = .password
    //
//        passwordInput.autocorrectionType = .no
//        passwordInput2.autocorrectionType = .no
    
    passwordInput.isSecureTextEntry = true
    passwordInput2.isSecureTextEntry = true
    
    mailInput.placeholder = "mail"
    passwordInput.placeholder = "password"
    passwordInput2.placeholder = "password repetition"
    nameInput.placeholder = "name"
    
    label.text = "Register"
    
    button.setTitle("Register", for: .normal)
    button.backgroundColor = .green
    
    self.backgroundColor = .white
    
    self.addSubview(label)
    self.addSubview(mailInput)
    self.addSubview(passwordInput2)
    self.addSubview(passwordInput)
  
    self.addSubview(nameInput)
    self.addSubview(button)
    
    pin(label.top, to: self.top, dist: 40)
    pin(mailInput.top, to: label.bottom, dist: 10)
    pin(passwordInput.top, to: mailInput.bottom, dist: 10)
    pin(passwordInput2.top, to: passwordInput.bottom, dist: 10)
    pin(nameInput.top, to: passwordInput2.bottom, dist: 10)
    pin(button.top, to: nameInput.bottom, dist: 10)
    pin(button.bottom, to: self.bottom, dist: -40)
    
    pin(label.left, to: self.left, dist: 40)
    pin(label.right, to: self.right, dist: -40)
    
    pin(button.left, to: self.left, dist: 40)
    pin(button.right, to: self.right, dist: -40)
    
    pin(nameInput.left, to: self.left, dist: 40)
    pin(nameInput.right, to: self.right, dist: -40)
    
    pin(mailInput.left, to: self.left, dist: 40)
    pin(mailInput.right, to: self.right, dist: -40)
    
    pin(passwordInput.left, to: self.left, dist: 40)
    pin(passwordInput.right, to: self.right, dist: -40)
    
    pin(passwordInput2.left, to: self.left, dist: 40)
    pin(passwordInput2.right, to: self.right, dist: -40)
    
    passwordInput.pinHeight(40)
    passwordInput2.pinHeight(40)
    nameInput.pinHeight(40)
    mailInput.pinHeight(40)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
