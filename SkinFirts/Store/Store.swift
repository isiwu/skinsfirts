//
//  Store.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 07/08/2025.
//

import Foundation

@Observable
class Store {
  static let data = Store()
  private var doctors = [DoctorData]()
  private var doctorAvailabilities = [Availability]()
  private init() { }  // Prevent creating multiple instances
  
  func getDoctors() -> [DoctorData] {
    self.doctors
  }
  func setDoctors(doctors: [DoctorData]) {
    self.doctors = doctors
  }
  func getDoctorAvailabilities() -> [Availability] {
    self.doctorAvailabilities
  }
  func setDoctorAvailability(availabilities: [Availability]) {
    self.doctorAvailabilities = availabilities
  }
}

struct DoctorData: Codable, Identifiable {
  let id: String
  let name: String
  let field: String
  let image: String
  let focus: String
  let profile: String
  let careerPath: String
  let highlight: String
  let gender: String
  let experience: Int
  let stars: Int
  let messages: Int
  
  init(id: String="", name: String="", field: String="", image: String="", focus: String="", profile: String="", careerPath: String="", highlight: String="", gender: String="", experience: Int=0, stars: Int=0, messages: Int=0) {
    self.id = id
    self.name = name
    self.field = field
    self.image = image
    self.focus = focus
    self.profile = profile
    self.careerPath = careerPath
    self.highlight = highlight
    self.gender = gender
    self.experience = experience
    self.stars = stars
    self.messages = messages
  }
}

struct Availability: Codable, Identifiable {
  let id: String
  let doctorId: String
  let date: Date
  var times: [TimeData]
  let status: String
}

struct TimeData: Codable, Identifiable {
  let id: String
  let availableId: String
  let startTime: String
  let endTime: String
}
