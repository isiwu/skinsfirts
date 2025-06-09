//
//  Doctor.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 09/06/2025.
//

import Foundation

class Doctor: Identifiable {
  var id = UUID()
  var name: String
  var field: String
  var image: String
  var stars: Int
  var messages: Int
  var isFavorite: Bool
  
  init(name: String="", field: String="", image: String="", stars: Int=1, messages: Int=2, isFavorite: Bool=false) {
    self.name = name
    self.field = field
    self.image = image
    self.stars = stars
    self.messages = messages
    self.isFavorite = isFavorite
  }
}

var sampleDoctors = [
  Doctor(name: "Dr. Olivia Turner, M.D.", field: "Dermato-Endocrinology", image: "doctor", stars: 4, messages: 60, isFavorite: false),
  Doctor(name: "Dr. Alexander Bennett, Ph.D.", field: "Dermato-Genetics", image: "doctor2", stars: 5, messages: 40, isFavorite: true),
  Doctor(name: "Dr. Sophia Martinez, Ph.D.", field: "Cosmetic Bioengineering", image: "doctor3", stars: 4, messages: 40, isFavorite: false),
  Doctor(name: "Dr. Olivia Turner, M.D.", field: "Dermato-Endocrinology", image: "doctor", stars: 4, messages: 50, isFavorite: true),
  Doctor(name: "Dr. Michael Davidson, M.D.", field: "Nano-Dermatology", image: "doctor4", stars: 4, messages: 60, isFavorite: false),
  Doctor(name: "Dr. Olivia Turner, M.D.", field: "Dermato-Endocrinology", image: "doctor", stars: 4, messages: 40, isFavorite: false)
]
