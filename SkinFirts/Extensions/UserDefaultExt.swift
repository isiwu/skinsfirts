//
//  UserDefaultExt.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 30/06/2025.
//

import Foundation

extension UserDefaults {
  func deleteKey(forKey: String) {
    var dict = self.dictionary(forKey: forKey)
    dict?.removeValue(forKey: forKey)
  }
}

enum UserKey: String {
  case login
  case logout
  case splash
}
