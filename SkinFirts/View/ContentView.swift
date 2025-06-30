//
//  ContentView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 23/05/2025.
//

import SwiftUI

struct ContentView: View {
//  @AppStorage(UserKey.splash.rawValue) private var splash = false
  @AppStorage(UserKey.login.rawValue) private var login = false
  var body: some View {
    if !login {
      WelcomeView()
    } else {
      MainView()
    }
  }
}

#Preview {
    ContentView()
}
