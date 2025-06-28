//
//  PaymentSuccessView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 28/06/2025.
//

import SwiftUI

struct PaymentSuccessView: View {
  var body: some View {
    ZStack {
      Color.skinFirtsBlue
        .ignoresSafeArea()
      
      VStack {
        Spacer()
        
        VStack(spacing: 60) {
          VStack(spacing: 25) {
            Image(systemName: "checkmark.circle")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 180, height: 180)
            
            VStack {
              Text("Congratulation")
                .font(.largeTitle)
                .fontweight(700)
              Text("Payment is Successfully")
                .font(.title2)
                .fontweight(500)
            }
          }
          .foregroundStyle(Color.white)
          
          VStack(spacing: 30) {
            Text("You have successfully booked an appointment with")
              .lineLimit(nil)
              .multilineTextAlignment(.leading)
            
            VStack {
              Text("Dr. Olivia Turner, M.D.")
                .font(.title)
                .fontweight(800)
              
              HStack {
                HStack {
                  Image("calendar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                  Text("Month, 24")
                    .font(.body)
                    .fontweight(500)
                }
                
                Spacer()
                
                HStack {
                  Image(systemName: "alarm")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                  Text("10:00 AM")
                    .font(.body)
                    .fontweight(500)
                }
              }
            }
          }
          .foregroundStyle(Color.white)
          .padding(.horizontal)
          .padding(.vertical, 25)
          .frame(width: 350)
          .overlay(content: {
            RoundedRectangle(cornerRadius: 20)
              .stroke(.white, lineWidth: 2)
          })
        }
        
        Spacer()
      }
      .padding(.horizontal)
      .navigationBarBackButtonHidden(true)
//      .toolbarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
    PaymentSuccessView()
}
