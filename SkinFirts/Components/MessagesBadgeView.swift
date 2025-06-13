//
//  MessagesBadgeView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 10/06/2025.
//

import SwiftUI

struct MessagesBadgeView: View {
  var messages = 20
  var body: some View {
    HStack {
      Image("bubble")
        .resizable()
        .aspectRatio(1, contentMode: .fit)
      Text("\(messages)")
    }
    .foregroundStyle(.skinFirtsBlue)
    .frame(height: 18)
    .padding(.horizontal, 8)
    .padding(.vertical, 4)
    .background(.white, in: .rect(cornerRadius: 15))  }
}

#Preview {
    MessagesBadgeView()
}
