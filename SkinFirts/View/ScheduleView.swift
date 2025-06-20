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
  var times = [["9:00AM", "9:30AM", "10:00AM", "10:30AM"], ["11: 00AM", "12:00PM", "12:30PM", "1:00PM"], ["2:00PM", "2:30PM", "3:00PM", "3:30PM"]]
  var body: some View {
    VStack {
      ScrollView {
        VStack {
          VStack {
            Text("Month")
            HStack {
              ForEach(1..<8) { i in
                Text("\(i)")
              }
            }
          }
          .hspacing(.leading)
          .background(Color.skinFirtsGrayBlue)
          
          VStack(spacing: 25) {
            VStack(alignment: .leading) {
              Text("Available Time")
                .font(.title3)
                .fontweight(500)
                .foregroundStyle(.skinFirtsBlue)
              
              ForEach(times.indices, id: \.self) { i in
                HStack {
                  ForEach(times[i], id: \.self) { time in
                    AvailableTime(time: time)
                  }
                }
              }
            }
            .padding(.horizontal)
            
            Rectangle()
              .fill(Color.skinFirtsBlue)
              .frame(height: 2)
            
            VStack(alignment: .leading) {
              Text("Pateint Details")
                .font(.title3)
                .fontweight(500)
                .foregroundStyle(.skinFirtsBlue)
              
              HStack {
                Text("Yourself")
                  .padding(.all, 4)
                  .overlay {
                    RoundedRectangle(cornerRadius: 15)
                      .stroke(.gray, lineWidth: 2)
                  }
                
                Text("Another Person")
                  .foregroundStyle(.white)
                  .padding(.all, 4)
                  .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 15))
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
                  Text("Male")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 10)
                    .overlay {
                      RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 2)
                    }
                  Text("Female")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 10)
                    .overlay {
                      RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 2)
                    }
                  Text("Other")
                    .padding(.vertical, 4)
                    .padding(.horizontal, 9)
                    .overlay {
                      RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, lineWidth: 2)
                    }
                }
              }
            }
            
            Rectangle()
              .fill(Color.skinFirtsBlue)
              .frame(height: 2)
            
            VStack(alignment: .leading) {
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
          }
          .padding(.horizontal)
        }
      }
      .padding()
    }
  }
  
  func AvailableTime(time: String) -> some View {
    Text(time)
      .textCase(.uppercase)
      .foregroundStyle(.white)
      .frame(width: 75, height: 35)
      .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 25))
  }
  
  func TextInputField(value: Binding<String>) -> some View {
    TextField("", text: value, prompt: Text("John Doe").font(.title2))
      .padding()
      .background(Color.fieldText2, in: .rect(cornerRadius: 10))
  }
}

#Preview {
    ScheduleView()
}
