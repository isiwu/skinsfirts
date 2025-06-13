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
  var body: some View {
    NavigationStack {
      List {
        ProfileLogoView()
          .listRowSeparator(.hidden)
          .listRowBackground(Color.white)
        
        ForEach(contents.indices, id: \.self) { index in
          if let text = contents[index]["text"], text != "Logout" {
            ZStack {
              NavigationLink(destination: ProfileCurrentView(currentView: $currentView)) {
                EmptyView()
              }
              .opacity(0)
              
              HStack {
                HStack {
                  Image(systemName: contents[index]["icon"]!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .padding(.all, 10)
                    .foregroundStyle(.skinFirtsBlue)
                    .background(Color.skinFirtsGrayBlue, in: .circle)
                  Image(systemName: "wallet.bifold")
                  
                  Text(contents[index]["text"]!)
                    .font(.title)
                    .fontweight(400)
                }
                
                Spacer()
                
                Image(systemName: "greaterthan")
                  .font(.system(size: 25))
                  .foregroundStyle(.skinFirtsGrayBlue)
              }
              .onTapGesture(perform: {
                if let text = contents[index]["text"] {
                  if text == "Profile" {
                    currentView = .profileEdit
                  } else if text == "Privacy Policy" {
                    currentView = .privacy
                  } else if text == "Settings" {
                    currentView = .setting
                  } else if text == "Help" {
                    currentView = .help
                  }
                }
              })
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
