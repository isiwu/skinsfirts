//
//  ProfileView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI

struct ProfileView: View {
  @Environment(\.dismiss) var dismiss
  @State private var currentView: CurrentView = .profileEdit
  var contents = [
    ["icon": "person", "text": "Profile"],
    ["icon": "heart", "text": "Favorite"],
    ["icon": "wallet.bifold", "text": "Payment Method"],
    ["icon": "exclamationmark.lock", "text": "Privacy Policy"],
    ["icon": "gearshape", "text": "Settings"],
    ["icon": "questionmark", "text": "Help"],
    ["icon": "square.and.arrow.up", "text": "Logout"],
  ]
  var views: [[String: Any]] = [
    ["profile": ProfileEditView()],
    ["privacy policy": ProfilePrivacyPolicyView()],
    ["settings": ProfileSettingView()],
    ["help": ProfileHelpView()]
  ]
  var body: some View {
    NavigationStack {
      List {
        ProfileLogoView()
          .listRowSeparator(.hidden)
          .listRowBackground(Color.white)
        
        ForEach(contents.indices, id: \.self) { index in
          if let text = contents[index]["text"], text != "Logout" {
            ZStack {
              if text == "Profile" || text == "Privacy Policy" || text == "Settings" || text == "Help" {
                if text.lowercased() == "profile" {
                  NavigationLink(destination: ProfileEditView()) {
                    EmptyView()
                  }
                  .opacity(0)
                } else if text.lowercased() == "privacy policy" {
                  NavigationLink(destination: ProfilePrivacyPolicyView()) {
                    EmptyView()
                  }
                  .opacity(0)
                } else if text.lowercased() == "settings" {
                  NavigationLink(destination: ProfileSettingView()) {
                    EmptyView()
                  }
                  .opacity(0)
                } else if text.lowercased() == "help" {
                  NavigationLink(destination: ProfileHelpView()) {
                    EmptyView()
                  }
                  .opacity(0)
                }
                
              }
              
              HStack {
                HStack {
                  Image(systemName: contents[index]["icon"]!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .padding(.all, 10)
                    .foregroundStyle(.skinFirtsBlue)
                    .background(Color.skinFirtsGrayBlue, in: .circle)
//                  Image(systemName: "wallet.bifold")
                  
                  Text(contents[index]["text"]!)
                    .font(.title)
                    .fontweight(400)
                }
                
                Spacer()
                
                Image(systemName: "greaterthan")
                  .font(.system(size: 25))
                  .foregroundStyle(.skinFirtsGrayBlue)
              }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.white)
          }
        }
        
        HStack {
          Image(systemName: "square.and.arrow.up")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 35, height: 35)
            .padding(.all, 10)
            .foregroundStyle(.skinFirtsBlue)
            .background(Color.skinFirtsGrayBlue, in: .circle)
          Image(systemName: "wallet.bifold")
          
          Text("Logout")
            .font(.title)
            .fontweight(400)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.white)
      }
      .listStyle(.plain)
      .padding(.horizontal)
      .navigationBarBackButtonHidden(true)
      .toolbar(content: {
        ToolbarItem(placement: .principal) {
          Text("My Profile")
            .foregroundStyle(.skinFirtsBlue)
            .font(.title)
            .fontweight(600)
        }
      })
    }
  }
  
  func ProfileLogoView() -> some View {
    HStack {
      Spacer()

      VStack {
        Image("profile")
          .resizable()
          .aspectRatio(1, contentMode: .fill)
          .frame(width: 130, height: 130)
        
        Text("John Doe")
          .foregroundStyle(.black)
          .font(.largeTitle)
          .fontweight(600)
      }

      Spacer()
    }
  }
}

public enum CurrentView: String {
  case profileEdit = "ProfileEdit"
  case favorite = "Favorite"
  case payment = "Payment Method"
  case privacy = "Privacy Policy"
  case setting = "Settings"
  case help = "Help"
  case logout = "Logout"
}

#Preview {
    ProfileView()
}
