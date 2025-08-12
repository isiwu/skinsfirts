//
//  APIRequest.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 09/08/2025.
//

import Foundation

class RestAPI {
  static let request = RestAPI()
  private let store = Store.data
  private init() { }    // Prevent creating multiple instances
  
  func getDoctors() async throws {
    let url = URL(string: "http://localhost:3000/api/doctors")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
    
    store.setDoctors(doctors: wrapper.data)
  }
  
  func getDoctorAvailabilities(doctorId: String) async throws {
    let url = URL(string: "http://localhost:3000/api/doctors/\(doctorId)/availabilities")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
//    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    decoder.dateDecodingStrategy = .formatted(formatter)
    
    let wrapper = try decoder.decode(WrapperAvailability.self, from: data)
    store.setDoctorAvailability(availabilities: wrapper.data)
  }
}

struct Wrapper: Codable {
  let status: Bool
  let data: [DoctorData]
}

struct WrapperAvailability: Codable {
  let status: Bool
  let data: [Availability]
}
