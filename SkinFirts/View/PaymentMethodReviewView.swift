//
//  PaymentMethodReviewView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 24/06/2025.
//

import SwiftUI

struct PaymentMethodReviewView: View {
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          HStack {
            Text("$")
            Text("100.00")
          }
          .font(.largeTitle)
          .fontweight(700)
          .foregroundStyle(Color.white)
          .frame(height: 90)
          .frame(maxWidth: .infinity)
          .background(Color.skinFirtsBlue)
          
          VStack {
            HStack(alignment: .top) {
              Image("doctor")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
              VStack(alignment: .leading, spacing: 10) {
                HStack {
                  Text("Dr. Olivia Turner, M.D.")
                    .font(.custom("LeagueSpartan", size: 20))
                    .fontweight(500)
                    .foregroundStyle(.skinFirtsBlue)
                  
                  Image("pro-badge")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .padding(.all, 4)
                    .background(Color.skinFirtsBlue, in: .circle)
                }
                
                Text("Dermato-Endocrinology")
                  .font(.body)
                  .fontweight(300)
                  .foregroundStyle(.black)
              }
              .padding(.top, 25)
            }
            .padding(.top, 30)
            
            HorizontalLineView()
            
            VStack(spacing: 15) {
              HStack {
                Text("Date / Hour")
                  .foregroundStyle(.skinFirtsBlue)
                
                Spacer()
                
                Text("Month 24, Year / 10:00 aM")
                  .font(.headline)
                  .fontweight(600)
              }
              
              HStack {
                Text("Duration")
                  .foregroundStyle(.skinFirtsBlue)
                
                Spacer()
                
                Text("30 minutes")
                  .font(.headline)
                  .fontweight(600)
              }
              
              HStack {
                Text("Booking For")
                  .foregroundStyle(.skinFirtsBlue)
                
                Spacer()
                
                Text("another person")
                  .font(.headline)
                  .fontweight(600)
              }
            }
            .padding(.vertical)
            
            HorizontalLineView()
            
            VStack(spacing: 15) {
              HStack {
                Text("Amount")
                  .foregroundStyle(.skinFirtsBlue)
                
                Spacer()
                
                Text("$100.00")
                  .font(.headline)
                  .fontweight(600)
              }
              
              HStack {
                Text("Duration")
                  .foregroundStyle(.skinFirtsBlue)
                
                Spacer()
                
                Text("30 minutes")
                  .font(.headline)
                  .fontweight(600)
              }
              
              HStack {
                Text("Total")
                  .foregroundStyle(.skinFirtsBlue)
                
                Spacer()
                
                Text("$100")
                  .font(.headline)
                  .fontweight(600)
              }
            }
            .padding(.vertical)
            
            HorizontalLineView()
            
            VStack {
              NavigationLink(destination: PaymentSuccessView()) {
                Text("Pay Now")
                  .font(.title)
                  .fontweight(600)
                  .foregroundStyle(.white)
                  .padding(.vertical, 10)
                  .frame(maxWidth: .infinity)
                  .background(Color.skinFirtsBlue, in: .capsule)
              }
            }
            .padding(.top, 100)
          }
          .padding(.horizontal)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
          ToolbarItem(placement: .topBarLeading) {
            Image("arrowback-white")
              .onTapGesture(perform: {
                dismiss()
              })
          }
          
          ToolbarItem(placement: .principal) {
            Text("Payment")
              .foregroundStyle(.white)
              .font(.title)
              .fontweight(600)
          }
        })
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.skinFirtsBlue, for: .navigationBar)
        .toolbarTitleDisplayMode(.inline)
      }
    }
  }
}

#Preview {
    PaymentMethodReviewView()
}
