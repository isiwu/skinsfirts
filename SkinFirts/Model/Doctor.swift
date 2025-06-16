//
//  Doctor.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 09/06/2025.
//

import Foundation
import SwiftData

@Model
class Doctor {
  var name: String
  var field: String
  var image: String
  var experienceLevel: Int
  var stars: Int
  var messages: Int
  var isFavorite: Bool
  var focus: String
  var availability: String
  var profile: String
  var careerPath: String
  var highlight: String
  private var genderRaw: Gender.RawValue = Gender.female.rawValue
  var gender: Gender {
    get { .init(rawValue: genderRaw) ?? .female}
    set { genderRaw = newValue.rawValue }
  }
  
  
  init(name: String="", field: String="", image: String="", experienceLevel: Int=14, stars: Int=4, messages: Int=30, isFavorite: Bool=true, focus: String="The impact of hormonal imbalances on skin conditions, specializing in acne, hirsutism, and other skin disorders.", availability: String="Mon-Sat / 9:00AM - 5:00PM", profile: String="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", careerPath: String="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", highlight: String="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", gender: Gender = .female) {
    self.name = name
    self.field = field
    self.image = image
    self.experienceLevel = experienceLevel
    self.stars = stars
    self.messages = messages
    self.isFavorite = isFavorite
    self.focus = focus
    self.availability = availability
    self.profile = profile
    self.careerPath = careerPath
    self.highlight = highlight
    self.gender = gender
  }
}

extension Doctor {
  enum Gender: String, CaseIterable, Codable {
    case male
    case female
  }
}

var sampleDoctors = [
  Doctor(name: "Dr. Olivia Turner, M.D.", field: "Dermato-Endocrinology", image: "doctor", experienceLevel: 12, stars: 4, messages: 60, isFavorite: false, gender: .female),
  Doctor(name: "Dr. Alexander Bennett, Ph.D.", field: "Dermato-Genetics", image: "doctor2", experienceLevel: 8, stars: 5, messages: 40, isFavorite: true, gender: .male),
  Doctor(name: "Dr. Sophia Martinez, Ph.D.", field: "Cosmetic Bioengineering", image: "doctor3", experienceLevel: 15, stars: 4, messages: 40, isFavorite: false, gender: .female),
  Doctor(name: "Dr. Olivia Turner, M.D.", field: "Dermato-Endocrinology", image: "doctor", experienceLevel: 6, stars: 4, messages: 50, isFavorite: true, gender: .female),
  Doctor(name: "Dr. Michael Davidson, M.D.", field: "Nano-Dermatology", image: "doctor4", experienceLevel: 13, stars: 4, messages: 60, isFavorite: false, gender: .male),
  Doctor(name: "Dr. Olivia Turner, M.D.", field: "Dermato-Endocrinology", image: "doctor", experienceLevel: 7, stars: 4, messages: 40, isFavorite: false, gender: .female)
]


