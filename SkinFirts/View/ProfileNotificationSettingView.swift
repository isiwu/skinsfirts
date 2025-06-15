//
//  ProfileNotificationSettingView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI

struct ProfileNotificationSettingView: View {
  @Bindable var notification = ProfileNotificationSettingViewModel()
  @Environment(\.dismiss) var dismiss
  var labels = ["General Notification", "Sound", "Vibrate", "Special Offers", "Payments", "Promo and discount", "Caskback"]
  var body: some View {
    Form {
      Toggle(isOn: $notification.generalNotification) {
        Text("General Notification")
          .font(.title2)
          .fontweight(400)
      }
      .listRowSeparator(.hidden)
//      .padding(.vertical)
      
      Toggle(isOn: $notification.sound) {
        Text("Sound")
          .font(.title2)
          .fontweight(400)
      }
      .listRowSeparator(.hidden)
      .padding(.vertical)
      
      Toggle(isOn: $notification.vibrate) {
        Text("Vibrate")
          .font(.title2)
          .fontweight(400)
      }
      .listRowSeparator(.hidden)
      .padding(.vertical)
      
      Toggle(isOn: $notification.specialsOffer) {
        Text("Special Offers")
          .font(.title2)
          .fontweight(400)
      }
      .listRowSeparator(.hidden)
      .padding(.vertical)
      
      Toggle(isOn: $notification.payments) {
        Text("Payments")
          .font(.title2)
          .fontweight(400)
      }
      .listRowSeparator(.hidden)
      .padding(.vertical)
      
      Toggle(isOn: $notification.promoAndDiscount) {
        Text("Promo and discount")
          .font(.title2)
          .fontweight(400)
      }
      .listRowSeparator(.hidden)
      .padding(.vertical)
      
      Toggle(isOn: $notification.cashback) {
        Text("Cashback")
          .font(.title2)
          .fontweight(400)
      }
      .listRowSeparator(.hidden)
      .padding(.vertical)
    }
//    .listRowBackground(Color.white)
    .tint(.skinFirtsBlue)
    .formHiddenBackground()
    .shortNavigationContent("Notification Setting", dismiss: dismiss)
  }
}

#Preview {
  NavigationStack {
    ProfileNotificationSettingView()
  }
}
