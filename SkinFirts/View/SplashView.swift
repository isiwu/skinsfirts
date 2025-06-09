//
//  SplashView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 23/05/2025.
//

import SwiftUI

struct SplashView: View {
  var body: some View {
    ZStack {
      Color.skinFirtsBlue
        .ignoresSafeArea()
      
      VStack {
        Spacer()
        
        Image("splash-skinfirts")
          .padding(.top, 70)
        
        VStack(spacing: -16) {
          Text("Skin")
          Text("Firts")
        }
        .foregroundStyle(.white)
        .fontWeight(.thin)
        .font(.system(size: 48))
        
        Text("Dermatology center")
          .foregroundStyle(.white)
          .fontWeight(.semibold)
          .font(.custom("LeagueSpartan", size: 16, relativeTo: .largeTitle))
        
        Spacer()
      }
    }
  }
}

#Preview {
    SplashView()
}
