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
  
  var isSameHour: Bool {
    return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
  }
  
  var isPast: Bool {
    return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedAscending
  }
  
  var startOfMonth: Date {
    Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
  }
  
  var endOfMonth: Date {
    Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth)!
  }
  
  var weekDayStart: Int {
    let components = Calendar.current.dateComponents([.weekday], from: self.startOfMonth)
    
    return components.weekday!
  }
  
  var daysInMonth: Int {
    let range = Calendar.current.range(of: .day, in: .month, for: self.startOfMonth)!
    
    return range.count
  }
  
  var nextMonth: Date {
    Calendar.current.date(byAdding: .month, value: 1, to: self.startOfMonth)!
  }
  
  var prevMonth: Date {
    Calendar.current.date(byAdding: .month, value: -1, to: self.startOfMonth)!
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
  
  func getWeekDays() -> [WeekDay] {
    let calendar = Calendar.current
    let startOfDay = calendar.startOfDay(for: self)
    let weekDay = calendar.dateInterval(of: .weekOfMonth, for: startOfDay)
    var weeks = [WeekDay]()
    
    guard let startOfWeek = weekDay?.start else { return [] }
    
    (0..<7).forEach { index in
      if let weekD = calendar.date(byAdding: .day, value: index, to: startOfWeek) {
        weeks.append(.init(date: weekD))
      }
    }
    
    return weeks
  }
  
  func getNextWeekDays() -> [WeekDay] {
    let calendar = Calendar.current
    let startOfLastDate = calendar.startOfDay(for: self)
    
    guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDate) else { return [] }
    
    return nextDate.getWeekDays()
  }
  
  func getPrevWeekDays() -> [WeekDay] {
    let calendar = Calendar.current
    let startOfFirstDate = calendar.startOfDay(for: self)
    
    guard let prevDate = calendar.date(byAdding: .day, value: -1, to: startOfFirstDate) else { return [] }
    
    return prevDate.getWeekDays()
  }
  
  struct WeekDay: Identifiable {
    var id = UUID()
    var date: Date
  }
}
