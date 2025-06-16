//
//  Notification.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 16/06/2025.
//

import Foundation
import SwiftData

@Model
class Notification {
  var title: String
  var message: String
  var date: Date
  private var categoryRaw: Category.RawValue = Category.schedule.rawValue
  var category: Category {
    get { .init(rawValue: categoryRaw) ?? .schedule}
    set { categoryRaw = newValue.rawValue }
  }
  
  enum Category: String, CaseIterable {
    case schedule
    case note
    case history
  }
  
  init(title: String="", message: String="", date: Date = .now, category: Category = .schedule) {
    self.title = title
    self.message = message
    self.date = date
    self.category = category
  }
}
