//
//  PaymentMethodReviewView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 24/06/2025.
//

import SwiftUI

struct PaymentMethodReviewView: View {
  var body: some View {
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
        Text("Pay Now")
          .font(.title)
          .fontweight(600)
          .foregroundStyle(.white)
          .padding(.vertical, 10)
          .frame(maxWidth: .infinity)
          .background(Color.skinFirtsBlue, in: .capsule)
      }
      .padding(.top, 50)
    }
    .padding(.horizontal)
  }
}

#Preview {
    PaymentMethodReviewView()
}
