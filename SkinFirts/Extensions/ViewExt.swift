//
//  ViewExt.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/06/2025.
//

import SwiftUI

extension View {
  func hspacing(_ alignment: Alignment) -> some View {
    self.frame(maxWidth: .infinity, alignment: alignment)
  }
  
  func vspacing(_ alignment: Alignment) -> some View {
    self.frame(maxHeight: .infinity, alignment: alignment)
  }
  
  @ViewBuilder
  func fontweight(_ size: Double) -> some View {
    if size == 100 {
      self.fontWeight(.thin)
    } else if size == 200 {
      self.fontWeight(.ultraLight)
    } else if size == 300 {
      self.fontWeight(.light)
    } else if size == 400 {
      self.fontWeight(.regular)
    } else if size == 500 {
      self.fontWeight(.medium)
    } else if size == 600 {
      self.fontWeight(.semibold)
    } else if size == 700 {
      self.fontWeight(.bold)
    } else if size == 800 {
      self.fontWeight(.heavy)
    } else if size == 900 {
      self.fontWeight(.black)
    }
  }
  
  @ViewBuilder
  func navigationContent(_ title: String, dismiss: DismissAction) -> some View {
    self.toolbar(content: {
      ToolbarItem(placement: .topBarLeading) {
        Image("arrowback")
          .onTapGesture(perform: {
            dismiss()
          })
      }
      
      ToolbarItem(placement: .principal) {
        Text(title)
          .foregroundStyle(.skinFirtsBlue)
          .font(.title)
          .fontweight(600)
      }
      
      ToolbarItem(placement: .topBarTrailing) {
        HStack {
          Image("search")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.all, 4)
            .frame(width: 30, height: 30)
            .background(Color.skinFirtsGrayBlue, in: .circle)
          Image("slider-blue")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(.all, 4)
            .frame(width: 30, height: 30)
            .background(Color.skinFirtsGrayBlue, in: .circle)
        }
      }
    })
  }
}
