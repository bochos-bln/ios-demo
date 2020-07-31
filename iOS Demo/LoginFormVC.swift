//
//
// LoginFormVC.swift
//
// Created by Ringo Müller-Gromes on 31.07.20.
// Copyright © 2020 Ringo Müller-Gromes. All rights reserved.
// 

import UIKit


class LoginFormVC: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    let contentView = LoginForm()
    self.view.addSubview(contentView)
    pin(contentView, toSafe: self.view, exclude: .bottom)
  }
  
}
