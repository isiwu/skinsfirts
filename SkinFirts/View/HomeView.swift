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
  @State private var doctorsData = [DoctorData]()
//  @Query var doctors: [Doctor]
  var store = Store.data
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          HeaderView()
          
          AppointmentBadge()
          
          DoctorsWithAppointmentView()
        }
      }
      .onAppear(perform: {
        self.doctorsData = store.getDoctors()
      })
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
          NavigationLink(destination: NotificationView()) {
            Image(systemName: "bell.badge")
              .font(.system(size: 25))
              .frame(width: 38, height: 38)
              .background(.skinFirtsGrayBlue, in: .circle)
          }
          
          NavigationLink(destination: ProfileView()) {
            Image(systemName: "gearshape")
              .font(.system(size: 25))
              .frame(width: 38, height: 38)
              .background(.skinFirtsGrayBlue, in: .circle)
          }
        }
      }
      
      HStack {
        HStack {
          NavigationLink(destination: DoctorsView(modelDoctors: doctorsData)) {
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
  
  func DoctorsWithAppointmentView() -> some View {
    VStack {
      ForEach(doctorsData) { doctor in
        DoctorWithAppointmentView(doctor: doctor)
      }
    }
    .padding(.vertical)
    .padding(.horizontal)
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
//    .modelContainer(previewContainer)
}
