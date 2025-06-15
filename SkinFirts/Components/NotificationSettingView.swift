//
//  NotificationSettingView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 15/06/2025.
//

import SwiftUI

struct NotificationSettingView: View {
  @Binding var setting: Bool
  var label: String = "Sound"
  var body: some View {
    Toggle(isOn: $setting) {
      Text(label)
        .font(.title2)
        .fontweight(400)
    }
  }
}

#Preview {
  NotificationSettingView(setting: .constant(true))
}
