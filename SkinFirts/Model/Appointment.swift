//
//  Appointment.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 29/06/2025.
//

import Foundation
import SwiftData

@Model
class Appointment {
  var time: String
  var date: Date
  var doctor: Doctor
  private var appointmentStatusRaw: AppointmentStatus.RawValue = AppointmentStatus.complete.rawValue
  var status: AppointmentStatus {
    get { .init(rawValue: appointmentStatusRaw) ?? .complete}
    set { appointmentStatusRaw = newValue.rawValue }
  }
  
  init(time: String="", date: Date = .now, doctor: Doctor, appointmentStatusRaw: AppointmentStatus = .complete) {
    self.time = time
    self.date = date
    self.doctor = doctor
    self.appointmentStatusRaw = appointmentStatusRaw.rawValue
  }
  
  enum AppointmentStatus: String {
    case complete
    case upcoming
    case cancelled
  }
}
