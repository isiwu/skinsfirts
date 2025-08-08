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
  private init() { }  // Prevent creating multiple instances
  
  func getDoctors() -> [DoctorData] {
    self.doctors
  }
  func setDoctors(doctors: [DoctorData]) {
    self.doctors = doctors
  }
  
}

struct DoctorData: Codable, Hashable, Identifiable {
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
