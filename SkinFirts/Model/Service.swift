//
//  Service.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 16/06/2025.
//

import SwiftData

@Model
class Service {
  var name: String
  var desc: String
  
  init(name: String="", desc: String="") {
    self.name = name
    self.desc = desc
  }
}
