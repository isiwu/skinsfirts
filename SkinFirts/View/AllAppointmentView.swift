//
//  AllAppointmentView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 28/06/2025.
//

import SwiftUI

struct AllAppointmentView: View {
  @Environment(\.dismiss) var dismiss
  @State private var currentFilter = "Complete"
  @Namespace var filter
  var doctors = sampleDoctors
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack {
          HStack {
            Filter(text: "Complete")
            Filter(text: "Upcoming")
            Filter(text: "Cancelled")
          }
          
//          Complete(doctor: doctors.first!)
          Upcoming(doctor: doctors.first!)
//          Cancelled(doctor: doctors.first!)
        }
        .padding(.horizontal, 10)
        .navigationBarBackButtonHidden(true)
        .shortNavigationContent("All Appointment", dismiss: dismiss)
        .toolbarTitleDisplayMode(.inline)
        .toolbarBackground(Color.white, for: .navigationBar)
      }
    }
  }
  
  func Filter(text: String) -> some View {
    Button(action: {
      withAnimation(.snappy) {
        currentFilter = text
      }
    }) {
      Text(text)
        .font(.title3)
        .fontweight(400)
    }
    .foregroundStyle(currentFilter == text ? .white : .skinFirtsBlue)
    .padding(.vertical, 10)
    .padding(.horizontal, 15)
    .background(content: {
      if currentFilter == text {
        RoundedRectangle(cornerRadius: 25)
          .fill(.skinFirtsBlue)
          .matchedGeometryEffect(id: "FILTER", in: filter)
      }
    })
    .background(Color.skinFirtsGrayBlue, in: .capsule)
  }
  
  func Complete(doctor: Doctor) -> some View {
    VStack(spacing: 15) {
      HStack {
        Image(doctor.image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 80, height: 80)
        
        VStack(alignment: .leading) {
          Text(doctor.name)
            .font(.title3)
            .fontweight(500)
            .foregroundStyle(.skinFirtsBlue)
          Text(doctor.field)
            .font(.body)
            .fontweight(300)
          
          HStack {
            HStack {
              Image(systemName: "star.fill")
              Text("\(doctor.stars)")
            }
            .foregroundStyle(.skinFirtsBlue)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background(Color.white, in: .capsule)
            
            Image(systemName: doctor.isFavorite ? "heart.fill" : "heart")
              .padding(.all, 8)
              .foregroundStyle(.skinFirtsBlue)
              .background(Color.white, in: .circle)
          }
        }
        .padding(.top, 40)
      }
      
      HStack {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
          Text("Re-book")
            .font(.title3)
            .fontweight(400)
        }
        .foregroundStyle(.skinFirtsBlue)
        .padding(.vertical, 8)
        .padding(.horizontal, 20)
        .background(Color.white, in: .capsule)
        
        NavigationLink(destination: AppointmentReviewView()) {
          Text("Add Review")
            .font(.title3)
            .fontweight(400)
            .foregroundStyle(.white)
            .padding(.vertical, 8)
            .padding(.horizontal, 20)
            .background(Color.skinFirtsBlue, in: .capsule)
        }
      }
    }
    .padding(.horizontal, 30)
    .padding(.bottom, 25)
    .hspacing(.leading)
    .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 20))
  }
  
  func Upcoming(doctor: Doctor) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Image(doctor.image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 80, height: 80)
        
        VStack(alignment: .leading) {
          Text(doctor.name)
            .font(.title3)
            .fontweight(500)
            .foregroundStyle(.skinFirtsBlue)
          Text(doctor.field)
            .font(.body)
            .fontweight(300)
        }
      }
      
      HStack {
        HStack {
          Image("doc-calendar")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20)
          Text("Friday, 20 June")
            .font(.callout)
            .fontweight(300)
        }
        .foregroundStyle(.skinFirtsBlue)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.white, in: .capsule)
        
        HStack(spacing: 2) {
          Image(systemName: "alarm")
          
          Text("9:30 AM - 10:00 AM")
            .font(.callout)
            .fontweight(300)
        }
        .foregroundStyle(.skinFirtsBlue)
        .padding(.vertical, 6)
        .padding(.horizontal, 6)
        .background(Color.white, in: .rect(cornerRadius: 20))
      }
      
      HStack(spacing: 15) {
        NavigationLink(destination: ScheduleDetailView(doctor: doctor)) {
          Text("Details")
            .font(.title2)
            .fontweight(400)
            .foregroundStyle(.white)
            .padding(.vertical, 8)
            .padding(.horizontal, 60)
            .background(Color.skinFirtsBlue, in: .capsule)
        }
        
        Spacer()
        
//        Image(systemName: "checkmark")
//          .resizable()
//          .aspectRatio(contentMode: .fit)
//          .frame(width: 20)
//          .foregroundStyle(.skinFirtsBlue)
//          .padding(.all, 10)
//          .background(Color.white, in: .circle)
        
        NavigationLink(destination: AppointmentCancelView()) {
          Image(systemName: "multiply")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20)
            .padding(.all, 10)
            .foregroundStyle(.skinFirtsBlue)
            .background(Color.white, in: .circle)
        }
      }
    }
    .padding(.horizontal)
    .padding(.vertical)
    .hspacing(.leading)
    .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 20))
  }
  
  func Cancelled(doctor: Doctor) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Image(doctor.image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 80, height: 80)
        
        VStack(alignment: .leading) {
          Text(doctor.name)
            .font(.title3)
            .fontweight(500)
            .foregroundStyle(.skinFirtsBlue)
          Text(doctor.field)
            .font(.body)
            .fontweight(300)
        }
      }
      
      NavigationLink(destination: AppointmentReviewView()) {
        Text("Add Review")
          .font(.title)
          .fontweight(400)
          .foregroundStyle(.white)
          .padding(.vertical, 8)
          .frame(maxWidth: .infinity)
          .background(Color.skinFirtsBlue, in: .capsule)
      }
    }
    .padding(.horizontal)
    .padding(.vertical)
    .hspacing(.leading)
    .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 20))
  }
}

#Preview {
    AllAppointmentView()
}
