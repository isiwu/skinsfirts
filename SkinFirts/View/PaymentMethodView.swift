//
//  PaymentMethodView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 24/06/2025.
//

import SwiftUI

struct PaymentMethodView: View {
  @State private var presentedPath = false
  @Environment(\.dismiss) var dismiss
  @Bindable private var payMethod = PayMethod()
  
  var body: some View {
    NavigationStack {
      VStack(spacing: 40) {
        VStack(alignment: .leading) {
          Text("Credit & Debit Card")
            .font(.title)
            .fontweight(400)
          
          PaymentMethod(image: "card", text: "Add New Card", value: $payMethod.card)
            .onTapGesture(perform: {
              payMethod.card.toggle()
              if payMethod.card {
                presentedPath = true
              }
            })
        }
        
        VStack(alignment: .leading) {
          Text("More Payment Option")
            .font(.title)
            .fontweight(400)
          
          VStack {
            PaymentMethod(image: "apple", text: "Apple Play", value: $payMethod.apple)
              .onTapGesture(perform: {
                payMethod.apple.toggle()
              })
            
            PaymentMethod(image: "paypal", text: "Paypal", value: $payMethod.paypal)
              .onTapGesture(perform: {
                payMethod.paypal.toggle()
              })
              
            
            PaymentMethod(image: "google", text: "Google Play", value: $payMethod.google)
              .onTapGesture(perform: {
                payMethod.google.toggle()
              })
          }
        }
      }
      .onChange(of: payMethod.card) { _, _ in
        if payMethod.card {
          payMethod.apple = false
          payMethod.paypal = false
          payMethod.google = false
        }
      }
      .onChange(of: payMethod.apple) { _, _ in
        if payMethod.apple {
          payMethod.card = false
          payMethod.paypal = false
          payMethod.google = false
        }
      }
      .onChange(of: payMethod.paypal) { _, _ in
        if payMethod.paypal {
          payMethod.apple = false
          payMethod.card = false
          payMethod.google = false
        }
      }
      .onChange(of: payMethod.google) { _, _ in
        if payMethod.google {
          payMethod.apple = false
          payMethod.paypal = false
          payMethod.card = false
        }
      }
      .navigationDestination(isPresented: $presentedPath) {
        PaymentMethodCardView()
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

@Observable
class PayMethod {
  var card: Bool
  var apple: Bool
  var paypal: Bool
  var google: Bool
  
  init(card: Bool=false, apple: Bool=false, paypal: Bool=false, google: Bool=false) {
    self.card = card
    self.apple = apple
    self.paypal = paypal
    self.google = google
  }
}

#Preview {
    PaymentMethodView()
}
