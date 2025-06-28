//
//  ProfileSettingView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI

struct ProfileSettingView: View {
  @Environment(\.dismiss) var dismiss
  private var contents = [
    ["icon": "lightbulb", "text": "Notification Setting"],
    ["icon": "key", "text": "Password Manager"],
    ["icon": "person", "text": "Delete Account"],
  ]
  var body: some View {
    NavigationStack {
      List {
        ForEach(contents.indices, id: \.self) { index in
          ZStack {
            if let text = contents[index]["text"] {
              if text.lowercased() == "notification setting" {
                NavigationLink(destination: ProfileNotificationSettingView()) {
                  EmptyView()
                }
                .opacity(0)
              } else if text.lowercased() == "password manager" {
                NavigationLink(destination: ProfilePasswordManagerView()) {
                  EmptyView()
                }
                .opacity(0)
              }
            }
            
            HStack {
              HStack {
                if let text = contents[index]["text"], text.lowercased() == "password manager" {
                  Image(systemName: contents[index]["icon"]!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotationEffect(.degrees(-45))
                    .frame(width: 35, height: 35)
                    .padding(.all, 10)
                    .foregroundStyle(.skinFirtsBlue)
                    .background(Color.skinFirtsGrayBlue, in: .circle)
                } else {
                  Image(systemName: contents[index]["icon"]!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .padding(.all, 10)
                    .foregroundStyle(.skinFirtsBlue)
                    .background(Color.skinFirtsGrayBlue, in: .circle)
                }
                
                Text(contents[index]["text"]!)
                  .font(.title)
                  .fontweight(400)
              }
              
              Spacer()
              
              if let text = contents[index]["text"], text.lowercased() != "delete account" {
                Image(systemName: "greaterthan")
                  .font(.system(size: 25))
                  .foregroundStyle(.skinFirtsGrayBlue)
              }
            }
          }
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.white)
      }
      .listStyle(.plain)
      .padding(.horizontal, 0)
      .navigationBarBackButtonHidden(true)
      .toolbarTitleDisplayMode(.inline)
      .toolbarBackground(Color.white, for: .navigationBar)
      .shortNavigationContent("Settings", dismiss: dismiss)
    }
  }
}

#Preview {
  ProfileSettingView()
}
