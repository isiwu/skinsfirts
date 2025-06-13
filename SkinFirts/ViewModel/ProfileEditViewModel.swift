//
//  ProfileEditViewModel.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI

@Observable
class ProfileEditViewModel {
  var fullName: String
  var phone: String
  var email: String
  var dob: Date
  var image: UIImage
  
  init(fullName: String="John Doe", phone: String="+123 567 89000", email: String="Johndoe@example.com", dob: Date = .now, image: UIImage=UIImage()) {
    self.fullName = fullName
    self.phone = phone
    self.email = email
    self.dob = dob
    self.image = image
  }
}
