//
//  RatingView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 10/06/2025.
//

import SwiftUI

struct DoctorsRatingView: View {
  var doctors = [Doctor]()
  var body: some View {
    ForEach(doctors) { doctor in
      DoctorView(doctor: doctor)
    }
  }
  
  func DoctorView(doctor: Doctor) -> some View {
    HStack(spacing: 10) {
      Image(doctor.image)
        .resizable()
        .aspectRatio(1, contentMode: .fill)
        .frame(width: 90, height: 90)
      
      VStack(alignment: .leading, spacing: 8) {
        HStack {
          HStack {
            Image("pro-badge")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 15, height: 15)
              .padding(.all, 4)
              .background(Color.skinFirtsBlue, in: .circle)
            
            Text("Professional Doctor")
              .foregroundStyle(.skinFirtsBlue)
              .font(.footnote)
              .fontweight(400)
          }
          
          Spacer()
          
          HStack {
            Image(systemName: "star.fill")
              
            Text("\(doctor.stars)")
          }
          .foregroundStyle(.skinFirtsBlue)
          .frame(height: 18)
          .padding(.horizontal, 8)
          .padding(.vertical, 4)
          .background(.white, in: .rect(cornerRadius: 15))
        }
        
        VStack(alignment: .leading, spacing: 4) {
          Text(doctor.name)
            .font(.custom("LeagueSpartan", size: 20))
            .fontweight(500)
            .foregroundStyle(.skinFirtsBlue)
          
          Text(doctor.field)
            .font(.custom("LeagueSpartan", size: 16))
            .fontweight(300)
            .foregroundStyle(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white, in: .rect(cornerRadius: 25))
        
        HStack {
          NavigationLink(destination: DoctorInfoView(doctor: doctor)) {
            Text("Info")
              .font(.title)
              .textScale(.secondary)
              .foregroundStyle(.white)
              .padding(.horizontal)
              .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 20))
          }
          
          Spacer()
          
          HStack {
            Image("doc-calendar")
              .resizable()
              .frame(width: 18, height: 18)
              .padding(.all, 4)
              .background(Color.white, in: .circle)
            Image(systemName: "questionmark")
              .frame(width: 18, height: 18)
              .padding(.all, 4)
              .background(Color.white, in: .circle)
              .foregroundStyle(.skinFirtsBlue)
            Image(systemName: "heart")
              .frame(width: 18, height: 18)
              .padding(.all, 4)
              .foregroundStyle(.skinFirtsBlue)
              .background(Color.white, in: .circle)
          }
        }
        .padding(.top, 8)
      }
    }
    .padding()
    .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 15))
  }
}

#Preview {
  NavigationStack {
    DoctorsRatingView(doctors: sampleDoctors)
  }
}
