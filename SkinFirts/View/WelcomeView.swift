//
//  RegisterView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 23/05/2025.
//

import SwiftUI

struct WelcomeView: View {
  var store = Store.data
  
  var body: some View {
    NavigationStack {
      VStack {
        Spacer()
        
        VStack(spacing: 70) {
          VStack {
            Image("register-skinfirts")
            VStack(spacing: -16) {
              Text("Skin")
              Text("Firts")
            }
            .foregroundStyle(.skinFirtsBlue)
            .fontWeight(.thin)
            .font(.system(size: 48))
            
            Text("Dermatology center")
              .foregroundStyle(.skinFirtsBlue)
              .fontWeight(.semibold)
              .font(.custom("LeagueSpartan", size: 16, relativeTo: .largeTitle))
          }
          
          VStack(spacing: 40) {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
              .multilineTextAlignment(.center)
              .font(.title3)
              .fontweight(300)
              .padding(.horizontal, 52)
            
            VStack {
              NavigationLink(destination: LoginView()) {
                Text("Log In")
                  .padding(.vertical)
                  .frame(maxWidth: .infinity)
                  .foregroundStyle(.white)
                  .font(.custom("LeagueSpartan", size: 24))
                  .background(.skinFirtsBlue, in: .rect(cornerRadius: 30))
                  .frame(width: 207)
              }
              
            }
            .padding(.bottom, 30)
          }
        }
      }
      .task {
        do {
          try await RestAPI.request.getDoctors()
        } catch {
          print("Error due => \(error)")
//          fatalError("Failed to fetch data")
        }
      }
    }
  }
  
//  func getDoctors() async throws {
//    let url = URL(string: "http://localhost:3000/api/doctors")!
//    let (data, _) = try await URLSession.shared.data(from: url)
//    let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
//    
//    store.setDoctors(doctors: wrapper.data)
//  }
}

//struct Wrapper: Codable {
//  let status: Bool
//  let data: [DoctorData]
//}

#Preview {
    WelcomeView()
}
