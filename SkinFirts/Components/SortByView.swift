//
//  SortByView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 10/06/2025.
//

import SwiftUI

struct SortByView: View {
  @Binding var active: SortStatus
  var doctors = [Doctor]()
  @Namespace private var sortBy
  var body: some View {
    HStack {
      Text("Sort by")
        .font(.callout)
        .fontweight(300)
//        .font(.system(size: 12))
      
      HStack(spacing: 2) {
        Text("A")
        Image(systemName: "line.diagonal.arrow")
          .rotationEffect(.degrees(45))
        Text("Z")
      }
      .font(.footnote)
      .fontweight(500)
      .foregroundStyle(active == .doctors ? .white : .skinFirtsBlue)
      .padding(.horizontal, 8)
      .padding(.vertical, 4)
      .background(content: {
        if active == .doctors {
          RoundedRectangle(cornerRadius: 15)
            .fill(.skinFirtsBlue)
            .matchedGeometryEffect(id: "SORTBY", in: sortBy)
        }
      })
      .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 15))
      .onTapGesture(perform: {
        if active != .doctors {
          withAnimation() {
            active = .doctors
          }
        }
      })
      
      Image(systemName: active == .rating ? "star.fill" : "star")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding(.all, 6)
        .frame(width: 25, height: 25)
        .foregroundStyle(active == .rating ? .white : .skinFirtsBlue)
        .background(content: {
          if active == .rating {
            Circle()
              .fill(.skinFirtsBlue)
              .matchedGeometryEffect(id: "SORTBY", in: sortBy)
          }
        })
        .background(Color.skinFirtsGrayBlue, in: .circle)
        .onTapGesture(perform: {
          if active != .rating {
            withAnimation() {
              active = .rating
            }
          }
        })
      
      Image(systemName: active == .favorite ? "heart.fill" : "heart")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding(.all, 6)
        .frame(width: 25, height: 25)
        .foregroundStyle(active == .favorite ? .white : .skinFirtsBlue)
        .background(content: {
          if active == .favorite {
            Circle()
              .fill(.skinFirtsBlue)
              .matchedGeometryEffect(id: "SORTBY", in: sortBy)
          }
        })
        .background(Color.skinFirtsGrayBlue, in: .circle)
        .onTapGesture(perform: {
          if active != .favorite {
            withAnimation(.snappy) {
              active = .favorite
            }
          }
        })
      
      Image(active == .male ? "male1" : "male")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding(.all, 6)
        .frame(width: 25, height: 25)
        .foregroundStyle(.skinFirtsBlue)
        .background(content: {
          if active == .male {
            Circle()
              .fill(.skinFirtsBlue)
              .matchedGeometryEffect(id: "SORTBY", in: sortBy)
          }
        })
        .background(Color.skinFirtsGrayBlue, in: .circle)
        .onTapGesture(perform: {
          if active != .male {
            withAnimation(.snappy) {
              active = .male
            }
          }
        })
      
      Image(active == .female ? "female1" : "female")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding(.all, 6)
        .frame(width: 30, height: 30)
        .foregroundStyle(.skinFirtsBlue)
        .background(content: {
          if active == .female {
            Circle()
              .fill(.skinFirtsBlue)
              .matchedGeometryEffect(id: "SORTBY", in: sortBy)
          }
        })
        .background(Color.skinFirtsGrayBlue, in: .circle)
        .onTapGesture(perform: {
          if active != .female {
            withAnimation(.snappy) {
              active = .female
            }
          }
        })
    }
    .hspacing(.leading)
  }
}

#Preview {
  SortByView(active: .constant(.doctors))
}
