//
//  SignupViewModel.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 20/06/2025.
//

import Foundation
import SwiftUI

@Observable
class SignupViewModel {
  var fullName: String
  var password: String
  var email: String
  var phone: String
  var dateOfBirth: Date
  
  init(fullName: String="", password: String="", email: String="", phone: String="", dateOfBirth: Date=Date()) {
    self.fullName = fullName
    self.password = password
    self.email = email
    self.phone = phone
    self.dateOfBirth = dateOfBirth
  }
}
