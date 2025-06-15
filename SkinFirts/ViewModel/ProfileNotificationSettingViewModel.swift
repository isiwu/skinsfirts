//
//  ProfileNotificationSettingViewModel.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 15/06/2025.
//

import SwiftUI

@Observable
class ProfileNotificationSettingViewModel {
  var generalNotification: Bool
  var sound: Bool
  var soundCall: Bool
  var vibrate: Bool
  var specialsOffer: Bool
  var payments: Bool
  var promoAndDiscount: Bool
  var cashback: Bool
  
  init(generalNotification: Bool=true, sound: Bool=true, soundCall: Bool=true, vibrate: Bool=false, specialsOffer: Bool=false, payments: Bool=true, promoAndDiscount: Bool=false, cashback: Bool=true) {
    self.generalNotification = generalNotification
    self.sound = sound
    self.soundCall = soundCall
    self.vibrate = vibrate
    self.specialsOffer = specialsOffer
    self.payments = payments
    self.promoAndDiscount = promoAndDiscount
    self.cashback = cashback
  }
}


