//
//  Faq.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 16/06/2025.
//

import SwiftData

@Model
class Faq {
  var topic: String
  var desc: String
  var popular: Bool
  
  init(topic: String="", desc: String="", popular: Bool=false) {
    self.topic = topic
    self.desc = desc
    self.popular = popular
  }
}
