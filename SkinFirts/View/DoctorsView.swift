//
//  DoctorsView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 09/06/2025.
//

import SwiftUI
//import SwiftData

struct DoctorsView: View {
  var modelDoctors = [Doctor]()
  @State private var currentSort: SortStatus  = .doctors
  @State private var doctors: [Doctor] = [Doctor]()
  @State private var doctor: Doctor = Doctor()
  @Environment(\.dismiss) var dismiss
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 20) {
          SortByView(active: $currentSort, doctors: doctors)
          
          if currentSort == .doctors || currentSort == .male || currentSort == .female {
            ForEach(doctors) { doctor in
              DoctorView(doctor: doctor)
            }
          } else if currentSort == .rating {
            DoctorsRatingView(doctors: doctors)
          } else if currentSort == .favorite {
            DoctorsFavoriteView(doctors: doctors)
          }
        }
        .onAppear(perform: {
          doctors = modelDoctors
        })
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
        .navigationContent(currentSort.rawValue, dismiss: dismiss)
        .onChange(of: currentSort) {
          if currentSort == .male || currentSort == .female {
            doctors = modelDoctors.filter { $0.gender.rawValue == currentSort.rawValue.lowercased() }
          } else if currentSort == .doctors {
            doctors = modelDoctors
          }
        }
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
            .font(.custom("LeagueSpartan", size: 20))
            .fontweight(500)
            .foregroundStyle(.skinFirtsBlue)
          
          Text(doctor.field)
            .font(.custom("LeagueSpartan", size: 16))
            .fontweight(300)
            .foregroundStyle(.black)
        }
        .padding(.top, 25)
        
        HStack {
          NavigationLink(destination: DoctorInfoView(doctor: doctor)) {
            Text("Info")
              .font(.title)
              .textScale(.secondary)
              .foregroundStyle(.white)
              .padding(.horizontal)
              .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 20))
          }
          
          Spacer()
          
          HStack {
            Image("doc-calendar")
              .resizable()
              .frame(width: 18, height: 18)
              .padding(.all, 4)
              .background(Color.white, in: .circle)
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

enum SortStatus: String {
  case doctors = "Doctors"
  case doctorinfo = "Doctor Info"
  case rating = "Rating"
  case favorite = "Favorite"
  case male = "Male"
  case female = "Female"
}

#Preview {
    DoctorsView(modelDoctors: sampleDoctors)
}
