//
//  ScheduleDetailView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 24/06/2025.
//

import SwiftUI

struct ScheduleDetailView: View {
  var doctor = DoctorData()
//  var doctor: Doctor
//  @State private var path = [Int]()
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          DoctorWithAppointmentView(doctor: doctor)
            .padding(.bottom)
          
          HorizontalLineView()
          
          HStack(alignment: .top) {
            VStack {
              Text("Month 24, Year")
                .padding(.vertical, 8)
                .padding(.horizontal, 30)
                .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 30))
                .foregroundStyle(Color.white)
              Text("WED, 10:00AM")
                .font(.title3)
                .foregroundStyle(Color.skinFirtsBlue)
            }
            
            Spacer()
            
            HStack {
              NavigationLink(destination: PaymentMethodView()) {
                Image(systemName: "checkmark")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 20, height: 20)
                  .foregroundStyle(.white)
                  .padding(.all, 8)
                  .background(Color.skinFirtsBlue, in: .circle)
              }
              
              Image(systemName: "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)
                .padding(.all, 8)
                .background(Color.skinFirtsBlue, in: .circle)
            }
          }
          .padding(.vertical)
          
          HorizontalLineView()
          
          VStack(spacing: 15) {
            HStack {
              Text("Booking For")
              
              Spacer()
              
              Text("Another Person")
                .font(.headline)
                .fontweight(600)
            }
            
            HStack {
              Text("Full Name")
              
              Spacer()
              
              Text("John Doe")
                .font(.headline)
                .fontweight(600)
            }
            
            HStack {
              Text("Age")
              
              Spacer()
              
              Text("30")
                .font(.headline)
                .fontweight(600)
            }
            
            HStack {
              Text("Gender")
              
              Spacer()
              
              Text("Female")
                .font(.headline)
                .fontweight(600)
            }
          }
          .padding(.vertical)
          
          HorizontalLineView()
          
          VStack(alignment: .leading, spacing: 8) {
            Text("Problem")
              .font(.title2)
              .fontweight(300)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
              .font(.body)
              .fontweight(300)
          }
          .padding(.top)
        }
//        .navigationDestination(for: Int.self) {_ in 
//          PaymentMethodView()
//        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbarTitleDisplayMode(.inline)
        .toolbarBackground(Color.white, for: .navigationBar)
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
          
          ToolbarItem(placement: .principal) {
            Text("Your appointment")
              .font(.title)
              .fontweight(600)
              .foregroundStyle(.skinFirtsBlue)
          }
          
//          ToolbarItem(placement: .bottomBar) {
//            Text("Continue")
//              .font(.title)
//              .fontweight(600)
//              .foregroundStyle(.white)
//              .padding(.vertical)
//              .frame(maxWidth: .infinity)
//              .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 30))
////              .onTapGesture(perform: {
////                path.append(32)
////              })
//          }
        })
      }
    }
  }
}

#Preview {
  ScheduleDetailView()
//  ScheduleDetailView(doctor: sampleDoctors.first!)
}
