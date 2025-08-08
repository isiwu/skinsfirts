//
//  DoctorWithAppointmentView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 24/06/2025.
//

import SwiftUI
import SwiftData

struct DoctorWithAppointmentView: View {
//  var doctor: Doctor
  var doctor = DoctorData()
  var body: some View {
    HStack(alignment: .top, spacing: 15) {
      RemoteImage(url: doctor.image)
        .frame(width: 90, height: 90)
        .clipShape(Circle())
//      Image(doctor.image)
//        .resizable()
//        .frame(width: 90, height: 90)
//        .clipShape(Circle())
      
      VStack(alignment: .leading) {
        VStack(alignment: .leading) {
          Text(doctor.name)
            .font(.custom("LeagueSpartan", size: 14))
            .fontweight(500)
            .foregroundStyle(.skinFirtsBlue)
          Text(doctor.field)
            .font(.custom("LeagueSpartan", size: 12))
            .fontweight(300)
            .foregroundStyle(.black)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .hspacing(.leading)
//        .frame(width: 220, alignment: .leading)
        .background(.white, in: .rect(cornerRadius: 10))
        
        HStack {
          HStack {
            RatingBadgeView(stars: doctor.stars)
            
            MessagesBadgeView(messages: doctor.messages)
          }
          
          
          Spacer()
          
          HStack {
            Image(systemName: "questionmark")
              .frame(width: 18, height: 18)
              .padding(.all, 4)
              .background(Color.white, in: .circle)
              
//            if doctor.isFavorite {
//              Image(systemName: "heart.fill")
//                .frame(width: 18, height: 18)
//                .padding(.all, 4)
//                .background(Color.white, in: .circle)
//            } else {
//              Image(systemName: "heart")
//                .frame(width: 18, height: 18)
//                .padding(.all, 4)
//                .background(Color.white, in: .circle)
//            }
          }
          .foregroundStyle(.skinFirtsBlue)
//          .padding(.trailing, -2)
        }
      }
    }
    .padding()
    .background(.skinFirtsGrayBlue, in: .rect(cornerRadius: 20))
  }
}

#Preview {
  DoctorWithAppointmentView()
//  DoctorWithAppointmentView(doctor: sampleDoctors.first!)
}
