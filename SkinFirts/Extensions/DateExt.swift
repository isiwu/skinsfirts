//
//  DateExt.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import Foundation

extension Date {
  func format(_ format: String) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = format
    
    return formatter.string(from: self)
  }
}
