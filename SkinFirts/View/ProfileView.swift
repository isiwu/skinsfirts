//
//  ProfileView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI

struct ProfileView: View {
  @AppStorage(UserKey.login.rawValue) private var login = false
  @Environment(\.dismiss) var dismiss
  @State private var currentView: CurrentView = .profileEdit
  @State private var logout = false
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
        .onTapGesture(perform: {
          logout.toggle()
        })
      }
      .listStyle(.plain)
      .padding(.horizontal, 2)
      .navigationBarBackButtonHidden(true)
      .navigationBarTitleDisplayMode(.inline)
      .navigationContent("My Profile", dismiss: dismiss)
      .toolbarBackground(Color.white, for: .navigationBar)
      .sheet(isPresented: $logout, content: {
        LogoutView()
          .presentationDetents([.height(250)])
          .presentationCornerRadius(30)
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
  
  func LogoutView() -> some View {
    VStack(spacing: 30) {
      Text("Logout")
        .font(.title)
        .fontweight(500)
        .foregroundStyle(.skinFirtsBlue)
      
      Text("are you sure you want to log out?")
        .font(.title3)
        .fontweight(400)
        .foregroundStyle(.black)
      
      HStack {
        GrayBlueButton(buttonText: "Cancel")
        
        BlueButton(buttonText: "Yes, Logout", action: logoutAction)
      }
    }
    .padding(.horizontal)
  }
  
  func logoutAction() {
    login = false
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
