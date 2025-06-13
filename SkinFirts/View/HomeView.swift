//
//  HomeView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
  @State private var search = ""
  @Query var doctors: [Doctor]
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          HeaderView()
          
          AppointmentBadge()
          
          DoctorsWithAppointmentView()
        }
      }
    }
  }
  
  func HeaderView() -> some View {
    VStack(spacing: 25) {
      HStack {
        HStack {
          Image("profile")
          VStack(alignment: .leading) {
            Text("Hi, WelcomeBack")
              .foregroundStyle(.skinFirtsBlue)
            Text("John Doe")
              .foregroundStyle(.black)
          }
        }
        Spacer()
        
        HStack {
          Image(systemName: "bell.badge")
//            .foregroundStyle(.skinFirtsBlue)
            .font(.system(size: 25))
            .frame(width: 38, height: 38)
            .background(.skinFirtsGrayBlue, in: .circle)
          
          Image(systemName: "gearshape")
            .font(.system(size: 25))
            .frame(width: 38, height: 38)
            .background(.skinFirtsGrayBlue, in: .circle)
        }
      }
      
      HStack {
        HStack {
          NavigationLink(destination: DoctorsView(modelDoctors: doctors)) {
            VStack {
              Image(systemName: "stethoscope")
              Text("Doctors")
                .font(.custom("LeagueSpartan", size: 12))
                .fontWeight(.light)
            }
            .foregroundStyle(.skinFirtsBlue)
          }
          
          VStack {
            Image(systemName: "heart")
            Text("Favorite")
              .font(.custom("LeagueSpartan", size: 12))
              .fontWeight(.light)
          }
          .foregroundStyle(.skinFirtsBlue)
        }
        
        Spacer()
        
        HStack {
          Image("slider")
          TextField("", text: $search, prompt: Text("search"))
          Image("search")
        }
        .padding(.vertical, 9)
        .padding(.horizontal, 10)
        .background(.skinFirtsGrayBlue, in: .rect(cornerRadius: 30))
      }
    }
    .padding(.bottom)
    .padding(.horizontal, 40)
  }
  
  func AppointmentBadge() -> some View {
    VStack {
      VStack {
        VStack {
          Text("11 Wednesday - Today")
            .hspacing(.trailing)
            .foregroundStyle(.skinFirtsBlue)
            .font(.custom("LeagueSpartan", size: 12))
            .fontweight(400)
          
          HStack(alignment: .top) {
            VStack(spacing: 16) {
              Text("9 am")
              Text("10 am")
              Text("11 am")
              Text("12 am")
            }
            .font(.custom("LeagueSpartan", size: 12))
            .fontweight(300)
            .foregroundStyle(.skinFirtsBlue)
            .padding(.top, -6)
            
            VStack(spacing: 12) {
              Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .foregroundStyle(.skinFirtsBlue)
                .frame(height: 1)
              
              HStack {
                VStack(alignment: .leading) {
                  HStack {
                    Text("Dr. Olivia Turner, M.D.")
                      .foregroundStyle(.skinFirtsBlue)
                      .font(.custom("LeagueSpartan", size: 14))
                      .fontweight(500)
                    
                    Spacer()
                    
                    HStack {
                      Image("badgecheck")
                      Image("badgeclose")
                    }
                  }
                  Text("Treatment and prevention of skin and photodermatitis.")
                    .font(.custom("LeagueSpartan", size: 12))
                    .fontweight(300)
                    .padding(.trailing, 50)
                }
              }
              .padding(.vertical, 10)
              .padding(.horizontal, 20)
              .background(.skinFirtsGrayBlue)
              
              Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .foregroundStyle(.skinFirtsBlue)
                .frame(height: 1)
                .padding(.bottom)
            }
          }
        }
      }
      .padding(.horizontal, 20)
      .padding(.vertical, 10)
      .background(.white, in: .rect(cornerRadius: 35))
    }
    .padding(.horizontal, 30)
    .padding(.vertical, 15)
    .hspacing(.leading)
    .background(.skinFirtsGrayBlue)
  }
  
  func DoctorWithAppointmentView(doctor: Doctor) -> some View {
    HStack(alignment: .top, spacing: 15) {
      Image(doctor.image)
        .resizable()
        .frame(width: 90, height: 90)
        .clipShape(Circle())
      
      VStack(alignment: .leading) {
        VStack(alignment: .leading) {
          Text(doctor.name)
            .font(.custom("LeagueSpartan", size: 14))
            .fontweight(500)
            .foregroundStyle(.skinFirtsBlue)
          Text(doctor.field)
            .font(.custom("LeagueSpartan", size: 12))
            .fontweight(300)
            .foregroundStyle(.black)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .frame(width: 220, alignment: .leading)
        .background(.white, in: .rect(cornerRadius: 10))
        
        HStack {
          HStack {
            RatingBadgeView(stars: doctor.stars)
            
            MessagesBadgeView(messages: doctor.messages)
          }
          
          
          Spacer()
          
          HStack {
            Image(systemName: "questionmark")
              .frame(width: 18, height: 18)
              .padding(.all, 4)
              .background(Color.white, in: .circle)
              
            if doctor.isFavorite {
              Image(systemName: "heart.fill")
                .frame(width: 18, height: 18)
                .padding(.all, 4)
                .background(Color.white, in: .circle)
            } else {
              Image(systemName: "heart")
                .frame(width: 18, height: 18)
                .padding(.all, 4)
                .background(Color.white, in: .circle)
            }
          }
          .foregroundStyle(.skinFirtsBlue)
          .padding(.trailing, -2)
        }
      }
    }
    .padding()
    .background(.skinFirtsGrayBlue, in: .rect(cornerRadius: 20))
  }
  
  func DoctorsWithAppointmentView() -> some View {
    VStack {
      ForEach(doctors) { doctor in
        DoctorWithAppointmentView(doctor: doctor)
      }
    }
    .padding(.vertical)
    .padding(.horizontal, 35)
  }
}

struct Line: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: rect.width, y: 0))
    return path
  }
}

#Preview {
    HomeView()
    .modelContainer(previewContainer)
}
