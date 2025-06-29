//
//  FavoriteView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 10/06/2025.
//

import SwiftUI

struct DoctorsFavoriteView: View {
  @State private var status = "doctors"
  @State private var currentIndex = -1
  var doctors = [Doctor]()
  var services = ["Dermato-Endocrinology", "Cosmetic Bioengineering", "Dermato-Genetics", "Solar Dermatology", "Dermato-Endocrinology"]
  var body: some View {
    VStack {
      HStack {
        Button(action: {
          status = "doctors"
        }) {
          Text("Doctors")
            .foregroundStyle(status=="doctors" ? .white : .skinFirtsBlue)
            .font(.title)
            .fontweight(400)
            .padding(.vertical)
            .padding(.horizontal, 35)
            .background(status=="doctors" ? Color.skinFirtsBlue : Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 40))
        }
        
        Button(action: {
          status = "services"
        }) {
          Text("Services")
            .foregroundStyle(status=="services" ? .white : .skinFirtsBlue)
            .font(.title)
            .fontweight(400)
            .padding(.vertical)
            .padding(.horizontal, 35)
            .background(status=="services" ? Color.skinFirtsBlue : Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 40))
        }
      }
      
      VStack {
        if status == "doctors" {
          ForEach(doctors) { doctor in
            DoctorView(doctor: doctor)
          }
        }
        
        if status == "services" {
          ForEach(services.indices, id: \.self) { index in
            Service(service: services[index], index)
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
        .frame(width: 90, height: 90)
      
      VStack(alignment: .leading, spacing: 2) {
        HStack {
          Image("pro-badge")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 15, height: 15)
            .padding(.all, 4)
            .background(Color.skinFirtsBlue, in: .circle)
          
          Text("Professional Doctor")
            .foregroundStyle(.skinFirtsBlue)
            .font(.footnote)
            .fontweight(400)
        }
        
        HStack {
          VStack(alignment: .leading, spacing: 4) {
            Text(doctor.name)
              .font(.custom("LeagueSpartan", size: 16))
              .fontweight(500)
              .foregroundStyle(.skinFirtsBlue)
            
            Text(doctor.field)
              .font(.custom("LeagueSpartan", size: 14))
              .fontweight(300)
              .foregroundStyle(.black)
          }
          
          Spacer()
          
          Image(systemName: "heart.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
            .foregroundStyle(.skinFirtsBlue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white, in: .rect(cornerRadius: 25))
        
        NavigationLink(destination: ScheduleDoctorProfileView(doctor: doctor)) {
          VStack {
            Text("Make Appointment")
              .foregroundStyle(.white)
              .font(.custom("LeagueSpartan", size: 15))
              .fontweight(300)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 6)
              .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 30))
          }
          .padding(.top, 8)
          
        }
      }
    }
    .padding()
    .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 15))
  }
  
  func Service(service: String, _ index: Int) -> some View {
    VStack {
      HStack {
        HStack {
          Image(systemName: "heart.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
          
          Text(service)
            .font(.custom("LeagueSpartan", size: 20))
            .font(.title3)
            .fontweight(600)
        }
        .foregroundStyle(.white)
        
        Spacer()
        
        Image(systemName: "lessthan")
          .foregroundStyle(.skinFirtsBlue)
          .rotationEffect(.degrees(-90))
          .font(.title)
          .padding(.all, 4)
          .background(Color.white, in: .circle)
      }
      .padding(.horizontal, 15)
      .padding(.vertical)
      .frame(maxWidth: .infinity)
      .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 30))
      .onTapGesture(perform: {
        withAnimation(.snappy) {
          if currentIndex == index {
            currentIndex = -1
          } else {
            currentIndex  = index
          }
        }
      })
      
      if index == currentIndex {
        VStack {
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.")
            .font(.body)
            .fontweight(200)
            .padding(.all, 25)
            .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 20))
          
          Text("looking doctors")
            .font(.title)
            .fontweight(500)
            .foregroundStyle(.skinFirtsBlue)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 40))
        }
        .padding(.top)
      }
    }
  }
}

#Preview {
    DoctorsFavoriteView(doctors: sampleDoctors)
}
