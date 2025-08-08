//
//  ContentView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 23/05/2025.
//

import SwiftUI

struct ContentView: View {
  @AppStorage(UserKey.login.rawValue) private var login = false
  var body: some View {
    VStack {
      if !login {
        WelcomeView()
      } else {
        MainView()
      }
    }
    .onAppear(perform: {
      undoLogin()
    })
  }
  
  func undoLogin() {
    login = false
  }
}

#Preview {
    ContentView()
}
