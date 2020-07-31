//
//
// RegisterView.swift
//
// Created by Ringo Müller-Gromes on 31.07.20.
// Copyright © 2020 Ringo Müller-Gromes. All rights reserved.
// 

import SwiftUI

/// The Register Form Demo as SwiftUI
struct RegisterView: View {
  
  @State var username: String = ""
  @State var pass: String = ""
  @State var pass2: String = ""
  @State var mail: String = ""
  
  var body: some View {
    VStack(spacing: 30) {
      Text("Register Demo")
      TextField("username", text: $username)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      SecureField("pass", text: $pass)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      SecureField("repeat pass", text: $pass2)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      TextField("e-mail", text: $mail)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
    
  }
}

struct RegisterView_Previews: PreviewProvider {
  static var previews: some View {
    RegisterView()
  }
}


