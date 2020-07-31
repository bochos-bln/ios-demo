//
//
// RegisterFormVC.swift
//
// Created by Ringo Müller-Gromes on 31.07.20.
// Copyright © 2020 Ringo Müller-Gromes. All rights reserved.
//

import UIKit


class RegisterFormVC: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Register"
    let contentView = RegisterForm()
    self.view.addSubview(contentView)
    pin(contentView, toSafe: self.view, exclude: .bottom)
  }
  
}
