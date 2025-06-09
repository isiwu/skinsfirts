//
//  DoctorsView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 09/06/2025.
//

import SwiftUI

struct DoctorsView: View {
  var doctors = sampleDoctors
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 20) {
          ForEach(doctors) { doctor in
            DoctorView(doctor: doctor)
          }
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
          ToolbarItem(placement: .topBarLeading) {
            Image("arrowback")
          }
          
          ToolbarItem(placement: .principal) {
            Text("Doctors")
              .foregroundStyle(.skinFirtsBlue)
              .font(.title)
              .fontweight(600)
          }
      })
      }
    }
  }
  
  func DoctorView(doctor: Doctor) -> some View {
    HStack(spacing: 10) {
      Image(doctor.image)
        .resizable()
        .aspectRatio(1, contentMode: .fill)
        .frame(width: 107, height: 107)
      
      VStack(alignment: .leading, spacing: 25) {
        VStack(alignment: .leading, spacing: 10) {
          Text(doctor.name)
            .font(.custom("League Spartan", size: 20))
            .fontweight(500)
            .foregroundStyle(.skinFirtsBlue)
          
          Text(doctor.field)
            .font(.custom("LeagueSpartan", size: 16))
            .fontweight(300)
            .foregroundStyle(.black)
        }
        .padding(.top, 25)
        
        HStack {
          Text("Info")
            .font(.title)
            .textScale(.secondary)
            .foregroundStyle(.white)
            .padding(.horizontal)
            .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 20))
          
          Spacer()
          
          HStack {
            Image("doc-calendar")
              .resizable()
              .frame(width: 18, height: 18)
              .padding(.all, 4)
              .background(Color.white, in: .circle)
//            Image("doct-i")
//              .resizable()
//              .frame(width: 18, height: 18)
//              .padding(.all, 4)
//              .background(Color.white, in: .circle)
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
      }
    }
    .padding()
    .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 15))
  }
}

#Preview {
    DoctorsView()
}
