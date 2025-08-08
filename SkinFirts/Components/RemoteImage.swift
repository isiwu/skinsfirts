//
//  RemoteImage.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 08/08/2025.
//

import SwiftUI

struct RemoteImage: View {
  var url: String = ""
//  var width: CGFloat = 200
//  var height: CGFloat = 200
  var body: some View {
    AsyncImage(url: URL(string: url)) { phase in
      switch phase {
      case .empty:
        ProgressView()
      case .success(let image):
        image.resizable()
      case .failure(let error):
        Text(error.localizedDescription)
      @unknown default:
        EmptyView()
      }
    }
//    .frame(width: width, height: height)
  }
}

#Preview {
    RemoteImage()
}
