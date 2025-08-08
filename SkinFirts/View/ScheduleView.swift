//
//  ScheduleView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 20/06/2025.
//

import SwiftUI

struct ScheduleView: View {
  @State private var email = ""
  @State private var age = ""
  @State private var editor = ""
  @State private var gender = "male"
  var times = [Time(time: "9:00AM"), Time(time: "9:30AM"), Time(time: "10:00AM", available: true), Time(time: "10:30AM"), Time(time: "11: 00AM"), Time(time: "11: 30AM", available: true), Time(time: "12:00PM"), Time(time: "12:30PM"), Time(time: "1:00PM", available: true), Time(time: "1:30PM", available: true), Time(time: "2:00PM"), Time(time: "2:30PM", available:  true), Time(time: "3:00PM", available: true), Time(time: "3:30PM"), Time(time: "4:00PM")
  ]
  @State private var pateint = "another person"
  @State private var currentDate = Date()
  @State private var weekDaysSlider: [Date.WeekDay] = []
  @State private var currentTime = Time(time: "10:00AM", available: true)
  @State private var currentWeek = false
  @Namespace private var pateintEffect
  @Namespace private var genderEffect
  @Environment(\.dismiss) var dismiss
//  var doctor: Doctor
  var doctor = DoctorData()
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          VStack {
            Text("\(currentDate.format("MMM")), \(currentDate.format("yyyy"))")
            HStack {
              Image(systemName: "lessthan")
                .font(.system(size: 20))
                .onTapGesture(perform: {
                  let prevWeek = weekDaysSlider.first
                  
                  if let date = prevWeek?.date {
                    weekDaysSlider = date.getPrevWeekDays()
                  }
                })
              ForEach(weekDaysSlider.indices, id: \.self) { index in
                WeekDaysView(day: weekDaysSlider[index])
              }
              Image(systemName: "greaterthan")
                .font(.system(size: 20))
                .onTapGesture(perform: {
                  let nextWeek = weekDaysSlider.last
                  
                  if let date = nextWeek?.date {
                    weekDaysSlider = date.getNextWeekDays()
                  }
                })
            }
          }
          .frame(maxWidth: .infinity)
          .padding(.top)
          .padding(.bottom, 30)
          .background(Color.skinFirtsGrayBlue)
          
          VStack(spacing: 25) {
            VStack(alignment: .leading) {
              Text("Available Time")
                .font(.title3)
                .fontweight(500)
                .foregroundStyle(.skinFirtsBlue)
              
              LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 40)),
                GridItem(.adaptive(minimum: 40)),
                GridItem(.adaptive(minimum: 40)),
                GridItem(.adaptive(minimum: 40))
              ]) {
                ForEach(times) { time in
                  AvailableTime(time: time)
                }
              }
            }
            .padding(.horizontal)
            
            HorizontalLineView()
            
            VStack(alignment: .leading) {
              Text("Pateint Details")
                .font(.title3)
                .fontweight(500)
                .foregroundStyle(.skinFirtsBlue)
              
              HStack {
                PateintView(text: "Yourself")
                PateintView(text: "Another Person")
              }
              
              VStack(alignment: .leading) {
                Text("Full Name")
                  .font(.title3)
                  .fontweight(300)
                
                TextInputField(value: $email)
              }
              
              VStack(alignment: .leading) {
                Text("Age")
                  .font(.title3)
                  .fontweight(300)
                
                TextInputField(value: $age)
              }
              
              VStack(alignment: .leading) {
                Text("Gender")
                  .font(.title3)
                  .fontweight(300)
                
                HStack {
                  GenderView(text: "Male")
                  GenderView(text: "Female")
                  GenderView(text: "Other")
                }
              }
            }
            
            HorizontalLineView()
            
            VStack(alignment: .leading, spacing: 50) {
              VStack {
                Text("Describe your problem")
                
                TextEditor(text: $editor)
                  .frame(maxWidth: .infinity)
                  .frame(height: 100)
                  .foregroundStyle(.white)
                  .padding(.vertical, 10)
                  .padding(.horizontal, 20)
                  .overlay(content: {
                    RoundedRectangle(cornerRadius: 6)
                      .stroke(.skinFirtsGrayBlue, lineWidth: 2)
                  })
                  .scrollContentBackground(.hidden)
              }
              
              NavigationLink(destination: ScheduleDetailView(doctor: doctor)) {
                Text("Continue")
                  .font(.title)
                  .fontweight(600)
                  .foregroundStyle(.white)
                  .padding(.vertical)
                  .frame(maxWidth: .infinity)
                  .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 30))
              }
            }
          }
          .padding(.horizontal)
        }
        .onAppear(perform: {
          weekDaysSlider = currentDate.getWeekDays()
        })
        .navigationBarBackButtonHidden(true)
        .toolbar(content: {
          ToolbarItem(placement: .topBarLeading) {
            Image("arrowback")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 25, height: 25)
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
          
          ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 4) {
              Text(doctor.name)
              .padding(.vertical, 4)
              .padding(.horizontal, 9)
              .foregroundStyle(.white)
              .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 20))
              
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
              
  //            HStack(spacing: 2) {
  //              Image(systemName: "questionmark")
  //                .resizable()
  //                .aspectRatio(contentMode: .fit)
  //                .frame(width: 15, height: 15)
  //                .padding(.all, 8)
  //                .background(Color.skinFirtsGrayBlue, in: .circle)
  //
  //              Image(systemName: "heart.fill")
  //                .resizable()
  //                .aspectRatio(contentMode: .fit)
  //                .frame(width: 15, height: 15)
  //                .padding(.all, 8)
  //                .background(Color.skinFirtsGrayBlue, in: .circle)
  //            }
  //            .foregroundStyle(.skinFirtsBlue)
            }
          }
        })
      }
    }
  }
  
  func WeekDaysView(day: Date.WeekDay) -> some View {
    VStack {
      Text(day.date.format("dd"))
      Text(day.date.format("E"))
    }
    .frame(width: 40.75, height: 60.58)
    .foregroundStyle(isSameDate(date1: day.date, date2: currentDate) ? .white : .black)
    .background(content: {
      if day.date.isToday {
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.skinFirtsBlue)
      }
    })
    .background(Color.white, in: .rect(cornerRadius: 20))
  }
  
  func AvailableTime(time: Time) -> some View {
    Text(time.time)
      .textCase(.uppercase)
      .foregroundStyle(time.available ? time.time == currentTime.time ? .white : .black : Color.fieldText)
      .frame(width: 75, height: 35)
      .background(time.available ? time.time == currentTime.time ? Color.skinFirtsBlue : Color.skinFirtsGrayBlue : Color.fieldText2, in: .rect(cornerRadius: 25))
      .onTapGesture(perform: {
        if time.available {
          withAnimation(.snappy) {
            currentTime = time
          }
        }
      })
  }
  
  func PateintView(text: String) -> some View {
    Text(text)
      .foregroundStyle(text.lowercased()==pateint ? .white : .black)
      .padding(.all, 4)
      .background(content: {
        if text.lowercased() == pateint {
          RoundedRectangle(cornerRadius: 15)
            .fill(.skinFirtsBlue)
            .matchedGeometryEffect(id: "PATEINT", in: pateintEffect)
        }
      })
//      .background(.white.shadow(.drop(radius: 3)), in: .rect(cornerRadius: 15))
      .overlay {
        if text.lowercased() != pateint {
          RoundedRectangle(cornerRadius: 15)
            .stroke(.gray, lineWidth: 2)
        }
      }
      .onTapGesture(perform: {
        withAnimation(.snappy) {
          pateint = text.lowercased()
        }
      })
  }
  
  func TextInputField(value: Binding<String>) -> some View {
    TextField("", text: value, prompt: Text("John Doe").font(.title2))
      .padding()
      .background(Color.fieldText2, in: .rect(cornerRadius: 10))
  }
  
  func GenderView(text: String) -> some View {
    Text(text)
      .foregroundStyle(gender==text.lowercased() ? .white : .black)
      .padding(.vertical, 4)
      .padding(.horizontal, 10)
      .background(content: {
        if text.lowercased() == gender {
          RoundedRectangle(cornerRadius: 15)
            .fill(.skinFirtsBlue)
            .matchedGeometryEffect(id: "GENDER", in: genderEffect)
        }
      })
      .overlay {
        if text.lowercased() != gender {
          RoundedRectangle(cornerRadius: 15)
            .stroke(.gray, lineWidth: 2)
        }
      }
      .onTapGesture(perform: {
        withAnimation(.snappy) {
          gender = text.lowercased()
        }
      })
  }
}

struct Time: Identifiable {
  var id = UUID()
  var time: String = ""
  var available: Bool = false
}

#Preview {
  ScheduleView()
//  ScheduleView(doctor: sampleDoctors.first!)
}
