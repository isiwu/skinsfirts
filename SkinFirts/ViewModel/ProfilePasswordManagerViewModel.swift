//
//  File.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 15/06/2025.
//

import SwiftUI

@Observable
class ProfilePasswordManagerViewModel {
  var currentPwd: String
  var newPwd: String
  var confirmPwd: String
  
  init(currentPwd: String="", newPwd: String="", confirmPwd: String="") {
    self.currentPwd = currentPwd
    self.newPwd = newPwd
    self.confirmPwd = confirmPwd
  }
}
