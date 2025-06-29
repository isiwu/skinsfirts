//
//  AppointmentReviewView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 29/06/2025.
//

import SwiftUI

struct AppointmentReviewView: View {
  @Environment(\.dismiss) var dismiss
  @State private var summary = "Enter Your Comment Here...."
  var rating = Rating()
  var doctor = sampleDoctors.first!
  var body: some View {
    ScrollView {
      VStack(spacing: 30) {
        VStack(alignment: .leading, spacing: 40) {
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
            .padding(.top)
            .font(.body)
            .fontweight(300)
          
          VStack(alignment: .leading, spacing: 20) {
            HStack {
              Spacer()
              
              Image(doctor.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
              
              Spacer()
            }
            
            HStack {
              Spacer()
              
              VStack {
                Text(doctor.name)
                  .font(.title)
                  .fontweight(500)
                  .foregroundStyle(Color.skinFirtsBlue)
                
                Text(doctor.field)
                  .font(.body)
                  .fontweight(300)
                
                HStack {
                  Image(systemName: doctor.isFavorite ? "heart.fill" : "heart")
                    .padding(.all, 8)
                    .foregroundStyle(.skinFirtsBlue)
                    .background(Color.skinFirtsGrayBlue, in: .circle)
                  
                  HStack {
                    Image(systemName: rating.one ? "star.fill" : "star")
                      .onTapGesture(perform: {
                        if rating.one {
                          if rating.one && rating.two && rating.three && rating.four && rating.five {
                            rating.five = false
                            rating.four = false
                            rating.three = false
                            rating.two = false
                            rating.one = false
                          } else {
                            rating.one = false
                          }
                        } else {
                          rating.one = true
                        }
                      })
                    Image(systemName: rating.two ? "star.fill" : "star")
                      .onTapGesture(perform: {
                        if rating.two {
                          if rating.one && rating.two && rating.three && rating.four && rating.five {
                            rating.five = false
                            rating.four = false
                            rating.three = false
                            rating.two = false
                          } else {
                            rating.two = false
                          }
                        } else {
                          rating.one = true
                          rating.two = true
                        }
                      })
                    Image(systemName: rating.three ? "star.fill" : "star")
                      .onTapGesture(perform: {
                        if rating.three {
                          if rating.one && rating.two && rating.three && rating.four && rating.five {
                            rating.five = false
                            rating.four = false
                            rating.three = false
                          } else {
                            rating.three = false
                          }
                        } else {
                          rating.one = true
                          rating.two = true
                          rating.three = true
                        }
                      })
                    Image(systemName: rating.four ? "star.fill" : "star")
                      .onTapGesture(perform: {
                        if rating.four {
                          if rating.one && rating.two && rating.three && rating.four && rating.five {
                            rating.four = false
                            rating.five = false
                          } else {
                            rating.four = false
                          }
                        } else {
                          rating.one = true
                          rating.two = true
                          rating.three = true
                          rating.four = true
                        }
                      })
                    Image(systemName: rating.five ? "star.fill" : "star")
                      .onTapGesture(perform: {
                        if rating.five {
                          rating.five = false
                        } else {
                          rating.one = true
                          rating.two = true
                          rating.three = true
                          rating.four = true
                          rating.five = true
                        }
                      })
                  }
                  .padding(.all, 8)
                  .foregroundStyle(.skinFirtsBlue)
                  .background(Color.skinFirtsGrayBlue, in: .capsule)
                }
              }
              
              Spacer()
            }
          }
        }
        
        VStack(alignment: .leading) {
          Text("Comment")
            .font(.title3)
            .fontweight(500)
          TextEditor(text: $summary)
            .frame(maxWidth: .infinity)
            .frame(height: 150)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .foregroundStyle(.skinFirtsBlue)
            .scrollContentBackground(.hidden)
            .background(Color.skinField, in: .rect(cornerRadius: 20))
        }
        
        Text("Add Review")
          .font(.title)
          .fontweight(400)
          .foregroundStyle(.white)
          .padding(.vertical, 10)
          .padding(.horizontal, 40)
          .background(Color.skinFirtsBlue, in: .capsule)
      }
      .padding(.horizontal)
      .navigationBarBackButtonHidden(true)
      .shortNavigationContent("Review", dismiss: dismiss)
      .toolbarTitleDisplayMode(.inline)
      .toolbarBackground(Color.white, for: .navigationBar)
    }
  }
}

@Observable
class Rating {
  var one: Bool
  var two: Bool
  var three: Bool
  var four: Bool
  var five: Bool
  
  init(one: Bool=false, two: Bool=false, three: Bool=false, four: Bool=false, five: Bool=false) {
    self.one = one
    self.two = two
    self.three = three
    self.four = four
    self.five = five
  }
}

#Preview {
  NavigationStack {
    AppointmentReviewView()
  }
}
