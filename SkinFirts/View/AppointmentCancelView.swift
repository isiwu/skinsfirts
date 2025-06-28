//
//  AppointmentCancelView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 28/06/2025.
//

import SwiftUI

struct AppointmentCancelView: View {
  @Environment(\.dismiss) var dismiss
  @Bindable var reason = CancelReason()
  @State private var summary = ""
  var body: some View {
    VStack(spacing: 50) {
      VStack(alignment: .leading, spacing: 40) {
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
          .padding(.top)
          .font(.body)
          .fontweight(300)
        
        VStack(alignment: .leading, spacing: 20) {
          HStack(spacing: 15) {
            RadioButtonView(checked: $reason.rescheduling)
              .padding(.all, 5)
              .overlay(content: {
                Circle()
                  .stroke(Color.skinFirtsBlue, lineWidth: 2)
              })
            
            Text("Rescheduling")
              .font(.title2)
              .fontweight(300)
          }
          .padding(.horizontal, reason.rescheduling ? 6: 0)
          .padding(.vertical, 8)
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(reason.rescheduling ? Color.skinFirtsGrayBlue : Color.white, in: .capsule)
          
          HStack(spacing: 15) {
            RadioButtonView(checked: $reason.weatherConditions)
              .padding(.all, 5)
              .overlay(content: {
                Circle()
                  .stroke(Color.skinFirtsBlue, lineWidth: 2)
              })
            
            Text("Weather Conditions")
              .font(.title2)
              .fontweight(300)
          }
          .padding(.horizontal, reason.weatherConditions ? 10: 0)
          .padding(.vertical, 8)
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(reason.weatherConditions ? Color.skinFirtsGrayBlue : Color.white, in: .capsule)
          
          HStack(spacing: 15) {
            RadioButtonView(checked: $reason.unexpectedWork)
              .padding(.all, 5)
              .overlay(content: {
                Circle()
                  .stroke(Color.skinFirtsBlue, lineWidth: 2)
              })
            
            Text("Unexpected Work")
              .font(.title2)
              .fontweight(300)
          }
          .padding(.horizontal, reason.unexpectedWork ? 6: 0)
          .padding(.vertical, 8)
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(reason.unexpectedWork ? Color.skinFirtsGrayBlue : Color.white, in: .capsule)
          
          HStack(spacing: 15) {
            RadioButtonView(checked: $reason.others)
              .padding(.all, 5)
              .overlay(content: {
                Circle()
                  .stroke(Color.skinFirtsBlue, lineWidth: 2)
              })
            
            Text("Others")
              .font(.title2)
              .fontweight(300)
          }
          .padding(.horizontal, reason.others ? 6: 0)
          .padding(.vertical, 8)
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(reason.others ? Color.skinFirtsGrayBlue : Color.white, in: .capsule)
        }
      }
      
      VStack(alignment: .leading) {
        Text("Summary")
          .font(.title3)
          .fontweight(500)
        TextEditor(text: $summary)
          .frame(maxWidth: .infinity)
          .frame(height: 170)
          .padding(.vertical, 10)
          .padding(.horizontal, 20)
          .foregroundStyle(.skinFirtsBlue)
          .scrollContentBackground(.hidden)
          .background(Color.skinField, in: .rect(cornerRadius: 20))
      }
      
      Text("Cancel Appointment")
        .font(.title)
        .fontweight(400)
        .foregroundStyle(.white)
        .padding(.vertical, 10)
        .padding(.horizontal, 40)
        .background(Color.skinFirtsBlue, in: .capsule)
    }
    .vspacing(.top)
    .padding(.horizontal)
    .navigationBarBackButtonHidden(true)
    .shortNavigationContent("Cancel Appointment", dismiss: dismiss)
    .toolbarTitleDisplayMode(.inline)
    .toolbarBackground(Color.white, for: .navigationBar)
  }
  
//  func RadioBtnView() -> some View {
//    Button(action: {
//      checked.toggle()
//    }) {
//      Image(systemName: checked ? "circle.fill" : "circle")
//        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .frame(width: 20, height: 20)
//        .font(.system(size: 30))
//        .foregroundColor(Color.skinFirtsBlue)
//    }
//  }
}

@Observable
class CancelReason {
  var rescheduling: Bool
  var weatherConditions: Bool
  var unexpectedWork: Bool
  var others: Bool
  
  init(rescheduling: Bool=false, weatherConditions: Bool=true, unexpectedWork: Bool=false, others: Bool=false) {
    self.rescheduling = rescheduling
    self.weatherConditions = weatherConditions
    self.unexpectedWork = unexpectedWork
    self.others = others
  }
}

#Preview {
  NavigationStack {
    AppointmentCancelView()
  }
}
