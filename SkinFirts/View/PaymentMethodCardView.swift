//
//  PaymentMethodCardView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 24/06/2025.
//

import SwiftUI

struct PaymentMethodCardView: View {
  @State private var cardName = "John Doe"
  @State private var cardNumber = "000 000 000 00"
  @State private var expiry = "04/28"
  @State private var cvv = "0000"
  @State private var presentedPath = false
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      VStack(spacing: 150) {
        VStack(spacing: 30) {
          TextFieldView(label: "Card Name", value: $cardName)
          TextFieldView(label: "Card Number", value: $cardNumber)
          
          HStack {
            TextFieldView(label: "Expiry Date", value: $expiry)
            TextFieldView(label: "CVV", value: $cvv)
          }
        }
        
        Text("Continue")
          .font(.title)
          .fontweight(600)
          .foregroundStyle(.white)
          .padding(.vertical, 10)
          .frame(maxWidth: .infinity)
          .background(Color.skinFirtsBlue, in: .capsule)
          .onTapGesture(perform: {
            presentedPath = true
          })
      }
      .navigationDestination(isPresented: $presentedPath) {
        PaymentMethodReviewView()
      }
      .padding(.horizontal)
      .vspacing(.top)
      .navigationBarBackButtonHidden(true)
      .toolbarBackground(Color.white, for: .navigationBar)
      .shortNavigationContent("Add Card", dismiss: dismiss)
    }
  }
}

#Preview {
    PaymentMethodCardView()
}
