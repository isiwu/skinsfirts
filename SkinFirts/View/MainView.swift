//
//  MainView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 30/06/2025.
//

import SwiftUI

struct MainView: View {
  @State private var selected: Tabs = .home
  var tabs: [Tabs] = [.home, .chat, .user, .calendar]
  var body: some View {
    NavigationStack {
      VStack {
        if selected.rawValue == "home" {
          HomeView()
        } else if selected.rawValue == "chat" {
          MessageView()
        } else if selected.rawValue == "user" {
          ProfileView()
        } else if selected.rawValue == "calendar" {
          AllAppointmentView()
        }
      }
      .safeAreaInset(edge: .bottom) {
        HStack {
          HStack {
            ForEach(tabs.indices, id: \.self) { index in
              Image(selected == tabs[index] ? "\(tabs[index].rawValue)-active" : tabs[index].rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .onTapGesture(perform: {
                  selected = tabs[index]
                  
                })
              
              if index < (tabs.count - 1) {
                Spacer()
              }
            }
          }
          .padding(.horizontal, 25)
          .padding(.vertical, 15)
          .frame(maxWidth: .infinity)
          .background(Color.skinFirtsBlue, in: .capsule)
        }
        .padding(.top)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .background(Color.white)
      }
      .padding(.bottom, -12)
    }
  }
  
  enum Tabs: String, CaseIterable {
    case home
    case chat
    case user
    case calendar
  }
}

#Preview {
    MainView()
}
