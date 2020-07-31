//
//
// RegisterForm.swift
//
// Created by Ringo Müller-Gromes on 31.07.20.
// Copyright © 2020 Ringo Müller-Gromes. All rights reserved.
//

import UIKit

class RegisterForm : UIView{
  
  
  let usernameInput = UITextField()
  let passwordInput = UITextField()
  let passwordInput2 = UITextField()
  let label = UILabel()
  let button = UIButton()
  
  // MARK: init
  public override init(frame: CGRect){
    super.init(frame: frame)
        
    usernameInput.layer.borderColor = UIColor.lightGray.cgColor
    passwordInput.layer.borderColor = UIColor.lightGray.cgColor
    passwordInput2.layer.borderColor = UIColor.lightGray.cgColor
    
    usernameInput.layer.borderWidth = 0.5
    passwordInput.layer.borderWidth = 0.5
    passwordInput2.layer.borderWidth = 0.5
    
//    passwordInput.textContentType = .password
//    passwordInput2.textContentType = .password
    
    usernameInput.placeholder = "username"
    passwordInput.placeholder = "password"
    passwordInput2.placeholder = "password repetition"
    
    label.text = "Register"
    
    button.setTitle("Register", for: .normal)
    button.backgroundColor = .green
    
    self.backgroundColor = .white
    
    self.addSubview(label)
    self.addSubview(usernameInput)
    self.addSubview(passwordInput)
    self.addSubview(passwordInput2)
    self.addSubview(button)
    
    pin(label.top, to: self.top, dist: 40)
    pin(usernameInput.top, to: label.bottom, dist: 10)
    pin(passwordInput.top, to: usernameInput.bottom, dist: 10)
    pin(passwordInput2.top, to: passwordInput.bottom, dist: 10)
    pin(button.top, to: passwordInput2.bottom, dist: 10)
    pin(button.bottom, to: self.bottom, dist: -40)
    
    pin(label.left, to: self.left, dist: 40)
    pin(label.right, to: self.right, dist: -40)
    
    pin(button.left, to: self.left, dist: 40)
    pin(button.right, to: self.right, dist: -40)
    
    pin(usernameInput.left, to: self.left, dist: 40)
    pin(usernameInput.right, to: self.right, dist: -40)
    
    pin(passwordInput.left, to: self.left, dist: 40)
    pin(passwordInput.right, to: self.right, dist: -40)
    
    pin(passwordInput2.left, to: self.left, dist: 40)
    pin(passwordInput2.right, to: self.right, dist: -40)
    
    passwordInput.pinHeight(40)
    passwordInput2.pinHeight(40)
    usernameInput.pinHeight(40)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
