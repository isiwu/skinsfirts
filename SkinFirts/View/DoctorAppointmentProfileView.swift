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
  @State private var date = Date()
  @State private var calendar = [AvailableDate]()
  @State private var first = 0
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      ScrollView {
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
            .padding(.top)
            .padding(.bottom)
          }
          .padding(.horizontal)
          
          VStack {
            HStack {
              Spacer()
              
              HStack {
                Image(systemName: "lessthan")
                  .onTapGesture(perform: {
                    getPrevMonth()
                    getCalendar()
                  })
                Text("\(date.format("MMM")), \(date.format("YYYY"))")
                  .textCase(.uppercase)
                  .font(.title2)
                  .fontweight(500)
                Image(systemName: "greaterthan")
                  .onTapGesture(perform: {
                    getNextMonth()
                    getCalendar()
                  })
              }
              .foregroundStyle(.skinFirtsBlue)
              
              Spacer()
            }
            
            HStack {
              ForEach(weekdays.indices, id: \.self) { index in
                Weekday(weekday: weekdays[index])
              }
            }
            .padding(.horizontal)
            
            LazyVGrid(columns: [
              GridItem(.adaptive(minimum: 60)),
              GridItem(.adaptive(minimum: 60)),
              GridItem(.adaptive(minimum: 60)),
              GridItem(.adaptive(minimum: 60)),
              GridItem(.adaptive(minimum: 60)),
              GridItem(.adaptive(minimum: 60)),
              GridItem(.adaptive(minimum: 60))
            ], spacing: 16) {
              ForEach(calendar.indices, id: \.self) { index in
                if calendar[index].available {
                  NavigationLink(destination: ScheduleView()) {
                    Text(calendar[index].date)
                      .padding(.all, calendar[index].date == "24" ? 8 : 0)
                      .foregroundStyle(calendar[index].date == "24" ? .white : .blue)
                      .background(content: {
                        if calendar[index].date == "24" {
                          Circle()
                            .fill(.skinFirtsBlue)
                        }
                      })
                      .opacity(calendar[index].available ? 1 : 0.3)
                  }
                } else {
                  Text(calendar[index].date)
                    .opacity(calendar[index].available ? 1 : 0.3)
                }
              }
            }
            .padding(.top, 25)
            .background(Color.white, in: .rect(cornerRadius: 20))
          }
          .padding(.top, 20)
          .padding(.bottom, 25)
          .background(Color.skinFirtsGrayBlue)
          .onAppear(perform: {
            getCalendar()
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
  
  func getCalendar() {
    let daysInMonth = date.daysInMonth
    let weekDayStart = date.weekDayStart
    calendar.removeAll()
    
    var count = 1
    
    while count <= 42 {
      if count < weekDayStart || ((count - weekDayStart) + 1) > daysInMonth {
        calendar.append(AvailableDate(date: "", available: false))
      } else {
//        calendar.append(String((count - weekDayStart) + 1))
        let date = ((count - weekDayStart) + 1)
        var availableDate = AvailableDate()
        if [1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 22, 23, 26, 27,].contains(date) {
          availableDate.date = String(date)
        } else {
          availableDate.date = String(date)
          availableDate.available = true
        }
        
        calendar.append(availableDate)
      }
      
      count += 1
    }
  }
  
  func getNextMonth() {
    date = self.date.nextMonth
  }
  
  func getPrevMonth() {
    date = self.date.prevMonth
  }
}

struct AvailableDate {
  var date: String
  var available: Bool
  
  init(date: String="", available: Bool=false) {
    self.date = date
    self.available = available
  }
}

#Preview {
  DoctorAppointmentProfileView(doctor: sampleDoctors.first!)
}
