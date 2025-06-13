//
//  RatingView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 10/06/2025.
//

import SwiftUI

struct RatingBadgeView: View {
  var stars = 4
  var body: some View {
    HStack {
      if stars == 5 {
        Image(systemName: "star.fill")
      } else {
        Image(systemName: "star")
      }
        
      Text("\(stars)")
    }
    .foregroundStyle(.skinFirtsBlue)
    .frame(height: 18)
    .padding(.horizontal, 8)
    .padding(.vertical, 4)
    .background(.white, in: .rect(cornerRadius: 15))
  }
}

#Preview {
    RatingBadgeView()
}
