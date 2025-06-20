//
//  DoctorAppointmentProfileView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 20/06/2025.
//

import SwiftUI

struct DoctorAppointmentProfileView: View {
  var doctor: Doctor
  var weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
  var date = Date()
  var calendar = [[Int]]()
  @State var a = 1
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      VStack {
        VStack {
          Profile()
            .padding(.horizontal, 10)
            .padding(.vertical, 20)
            .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 15))
          
          VStack(alignment: .leading) {
            Text("Profile")
              .font(.title2)
              .fontweight(500)
              .foregroundStyle(.skinFirtsBlue)
            
            Text(doctor.profile)
              .font(.footnote)
              .fontweight(300)
          }
        }
        .padding(.horizontal)
        
        VStack {
          HStack {
            Spacer()
            
            HStack {
              Image(systemName: "lessthan")
              Text("Month")
                .textCase(.uppercase)
                .font(.title2)
                .fontweight(500)
              Image(systemName: "greaterthan")
            }
            .foregroundStyle(.skinFirtsBlue)
            
            Spacer()
          }
          
          HStack {
            ForEach(weekdays.indices, id: \.self) { index in
              Weekday(weekday: weekdays[index])
            }
          }
          
          GetCalendar()
        }
        .padding(.top, 20)
        .padding(.horizontal)
        .padding(.bottom)
        .background(Color.skinFirtsGrayBlue)
        .onAppear(perform: {
          
        })
      }
      .navigationBarBackButtonHidden(true)
      .toolbar(content: {
        ToolbarItem(placement: .topBarLeading) {
          HStack {
            HStack {
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
              
              HStack(spacing: 2) {
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
              
              Image("phone-white")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(Color.skinFirtsBlue, in: .circle)
              
              Image("video-white")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(Color.skinFirtsBlue, in: .circle)
              
              Image("chat-white")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.all, 4)
                .background(Color.skinFirtsBlue, in: .circle)
            }
            
            Spacer()
            
          }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
          HStack(spacing: 3) {
            Image(systemName: "questionmark")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 15, height: 15)
              .padding(.all, 8)
              .background(Color.skinFirtsGrayBlue, in: .circle)
              
            Image(systemName: "heart.fill")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 15, height: 15)
              .padding(.all, 8)
              .background(Color.skinFirtsGrayBlue, in: .circle)
          }
          .foregroundStyle(.skinFirtsBlue)
        }
      })
    }
  }
  
  func Profile() -> some View {
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
        
//        HStack {
//          HStack {
//            Image("calendar2")
//              .resizable()
//              .aspectRatio(contentMode: .fit)
//              .frame(width: 15, height: 20)
//            Text("Schedule")
//              .font(.custom("LeagueSpartan", size: 16))
//              .fontweight(300)
//              .foregroundStyle(.white)
//          }
//          .padding(.vertical, 4)
//          .padding(.horizontal, 6)
//          .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 20))
//          
//          Spacer()
//          
//          HStack(spacing: 3) {
//            Image(systemName: "questionmark")
//              .frame(width: 18, height: 18)
//              .padding(.all, 4)
//              .background(Color.white, in: .circle)
//            
//            Image(systemName: "star")
//              .frame(width: 18, height: 18)
//              .padding(.all, 4)
//              .background(Color.white, in: .circle)
//              
//            Image(systemName: "heart")
//              .frame(width: 18, height: 18)
//              .padding(.all, 4)
//              .background(Color.white, in: .circle)
//          }
//          .foregroundStyle(.skinFirtsBlue)
//        }
      }
    }
  }
  
  func Weekday(weekday: String) -> some View {
    Text(weekday)
      .textCase(.uppercase)
      .foregroundStyle(.white)
      .frame(width: 45, height: 20)
      .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 25))
  }
  
  @ViewBuilder
  func GetCalendar() -> some View {
    let startWeekday = date.startOfMonth.format("EE")
    let endDate = Int(date.endOfMonth.format("dd"))!
    
    if startWeekday == "Sun" {
      VStack {
        ForEach(1..<6) { row in
          HStack {
            ForEach(1..<8) { column in
              if a <= endDate {
                makeView()
              }
            }
          }
        }
      }
    }
  }
  
  func makeView() -> some View {
    self.a += 1
    return Text("\(a)")
  }
}

#Preview {
  DoctorAppointmentProfileView(doctor: sampleDoctors.first!)
}
