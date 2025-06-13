//
//  ProfileCurrentView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI

struct ProfileCurrentView: View {
  @Binding var currentView: CurrentView
  var body: some View {
    if currentView == .profileEdit {
      ProfileEditView()
    } else if currentView == .setting {
      ProfileSettingView()
    } else if currentView == .privacy {
      ProfilePrivacyPolicyView()
    } else if currentView == .help {
      ProfileHelpView()
    }
  }
}

#Preview {
  ProfileCurrentView(currentView: .constant(.profileEdit))
}
