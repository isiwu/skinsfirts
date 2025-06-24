//
//  PaymentMethodView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 24/06/2025.
//

import SwiftUI

struct PaymentMethodView: View {
  @State private var card = true
  @State private var apple = false
  @State private var paypal = false
  @State private var google = false
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      VStack(spacing: 40) {
        VStack(alignment: .leading) {
          Text("Credit & Debit Card")
            .font(.title)
            .fontweight(400)
          
          PaymentMethod(image: "card", text: "Add New Card", value: $card)
        }
        
        VStack(alignment: .leading) {
          Text("More Payment Option")
            .font(.title)
            .fontweight(400)
          
          VStack {
            PaymentMethod(image: "apple", text: "Apple Play", value: $apple)
            
            PaymentMethod(image: "paypal", text: "Paypal", value: $paypal)
            
            PaymentMethod(image: "google", text: "Google Play", value: $google)
          }
        }
      }
      .vspacing(.top)
      .padding(.horizontal)
      .navigationBarBackButtonHidden(true)
//      .toolbarTitleDisplayMode(.inline)
      .toolbarBackground(Color.white, for: .navigationBar)
      .shortNavigationContent("Payment Method", dismiss: dismiss)
    }
  }
  
  func PaymentMethod(image: String, text: String, value: Binding<Bool>) -> some View {
    HStack {
      HStack {
        Image(image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 40, height: 40)
          .foregroundStyle(.skinFirtsBlue)
        Text(text)
          .font(.title)
          .fontweight(400)
          .foregroundStyle(.fieldText)
      }
      
      Spacer()
      
      RadioButtonView(checked: value)
        .padding(.all, 5)
        .overlay(content: {
          Circle()
            .stroke(Color.skinFirtsBlue, lineWidth: 2)
        })
    }
    .padding(.horizontal)
    .padding(.vertical, 8)
    .background(Color.fieldText2, in: .capsule)
  }
}

#Preview {
    PaymentMethodView()
}
