//
//  DoctorInfoView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 10/06/2025.
//

import SwiftUI

struct DoctorInfoView: View {
  var doctor: Doctor
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 10) {
          DoctorProfile()
          .padding(.horizontal, 10)
          .padding(.vertical, 20)
          .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 15))
          
          VStack(spacing: 30) {
            VStack(alignment: .leading) {
              Text("Profile")
                .font(.title2)
                .fontweight(500)
                .foregroundStyle(.skinFirtsBlue)
              
              Text(doctor.profile)
                .font(.footnote)
                .fontweight(300)
            }
            
            VStack(alignment: .leading) {
              Text("Career Path")
                .font(.title2)
                .fontweight(500)
                .foregroundStyle(.skinFirtsBlue)
              
              Text(doctor.careerPath)
                .font(.footnote)
                .fontweight(300)
            }
            
            VStack(alignment: .leading) {
              Text("Highlights")
                .font(.title2)
                .fontweight(500)
                .foregroundStyle(.skinFirtsBlue)
              
              Text(doctor.highlight)
                .font(.footnote)
                .fontweight(300)
            }
          }
          .padding(.top, 20)
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
          ToolbarItem(placement: .topBarLeading) {
            Image("arrowback")
              .overlay(content: {
                Circle()
                  .frame(width: 40, height: 40)
                  .background()
                  .blendMode(.destinationOver)
                  .onTapGesture(perform: {
                    dismiss()
                  })
              })
          }
          
          ToolbarItem(placement: .principal) {
            Text("Doctor Info")
              .foregroundStyle(.skinFirtsBlue)
              .font(.title)
              .fontweight(600)
          }
      })
        .toolbarTitleDisplayMode(.inline)
      }
    }
  }
  
  private func DoctorProfile() -> some View {
    VStack(spacing: 20) {
      HStack {
        Image(doctor.image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 150, height: .infinity)
        VStack {
          HStack() {
            Image("exp-badge")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 20, height: 20)
              .padding(.all, 6)
              .background(Color.skinFirtsGrayBlue, in: .circle)
            
            VStack(alignment: .leading, spacing: -5) {
              Text("\(doctor.experienceLevel) Year")
                .font(.system(size: 16))
                .fontweight(400)
              Text("experience")
                .font(.system(size: 14))
                .fontweight(300)
            }
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal)
          .padding(.vertical, 4)
          .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 20))
          .foregroundStyle(.white)
          
          Text("\(Text("Focus:").font(.body)) \(Text("The impact of hormonal imbalances on skin conditions, specializing in acne, hirsutism, and other skin disorders.").font(.footnote))")
            .foregroundStyle(.white)
            .fontweight(600)
            .padding()
            .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 20))
//              .frame(width: 170)
        }
      }
      
      VStack {
        Text(doctor.name)
          .font(.custom("LeagueSpartan", size: 20))
          .fontweight(500)
          .foregroundStyle(.skinFirtsBlue)
        
        Text(doctor.field)
          .font(.custom("LeagueSpartan", size: 15))
          .fontweight(300)
      }
      .padding(.vertical, 10)
      .frame(maxWidth: .infinity)
      .background(Color.white, in: .rect(cornerRadius: 15))
      
      VStack(alignment: .leading) {
        HStack(spacing: 6) {
          HStack(spacing: 1) {
            RatingBadgeView()
            
            MessagesBadgeView()
          }
          
          HStack(spacing: 2) {
            Image(systemName: "alarm")
            
            Text(doctor.availability)
              .font(.footnote)
              .fontweight(300)
          }
          .foregroundStyle(.skinFirtsBlue)
          .padding(.vertical, 2)
          .padding(.horizontal, 6)
          .background(Color.white, in: .rect(cornerRadius: 20))
        }
        
        HStack {
          NavigationLink(destination: ScheduleView(doctor: doctor)) {
            HStack {
              Image("calendar2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15, height: 20)
              Text("Schedule")
                .font(.custom("LeagueSpartan", size: 16))
                .fontweight(300)
                .foregroundStyle(.white)
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 6)
            .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 20))
          }
          
          Spacer()
          
          HStack(spacing: 3) {
            Image(systemName: "questionmark")
              .frame(width: 18, height: 18)
              .padding(.all, 4)
              .background(Color.white, in: .circle)
            
            Image(systemName: "star")
              .frame(width: 18, height: 18)
              .padding(.all, 4)
              .background(Color.white, in: .circle)
              
            Image(systemName: "heart")
              .frame(width: 18, height: 18)
              .padding(.all, 4)
              .background(Color.white, in: .circle)
          }
          .foregroundStyle(.skinFirtsBlue)
        }
      }
    }
  }
}

#Preview {
  DoctorInfoView(doctor: sampleDoctors.first!)
}
