//
//  DateExt.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import Foundation

extension Date {
  var isToday: Bool {
    Calendar.current.isDateInToday(self)
  }
  
  var isYesterday: Bool {
    Calendar.current.isDateInYesterday(self)
  }
  
  var isMorePastDate: Bool {
    if Calendar.current.isDateInToday(self) || Calendar.current.isDateInYesterday(self) {
      return false
    }
    
    return true
  }
  
  var startOfMonth: Date {
    Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
  }
  
  var endOfMonth: Date {
    Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth)!
  }
  
  func isSameDate(date: Date) -> Bool {
    Calendar.current.isDate(date, inSameDayAs: self)
  }
  
  func format(_ format: String) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = format
    
    return formatter.string(from: self)
  }
}
