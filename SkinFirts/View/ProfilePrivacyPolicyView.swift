//
//  ProfilePrivacyPolicyView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI

struct ProfilePrivacyPolicyView: View {
  @Environment(\.dismiss) var dismiss
  var terms = ["Ut lacinia justo sit amet lorem sodales accumsan. Proin malesuada eleifend fermentum. Donec condimentum, nunc at rhoncus faucibus, ex nisi laoreet ipsum, eu pharetra eros est vitae orci. Morbi quis rhoncus mi. Nullam lacinia ornare accumsan. Duis laoreet, ex eget rutrum pharetra, lectus nisl posuere risus, vel facilisis nisi tellus ac turpis.", "Ut lacinia justo sit amet lorem sodales accumsan. Proin malesuada eleifend fermentum. Donec condimentum, nunc at rhoncus faucibus, ex nisi laoreet ipsum, eu pharetra eros est vitae orci. Morbi quis rhoncus mi. Nullam lacinia ornare accumsan. Duis laoreet, ex eget rutrum pharetra, lectus nisl posuere risus, vel facilisis nisi tellus.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam.", "Nunc auctor tortor in dolor luctus, quis euismod urna tincidunt. Aenean arcu metus, bibendum at rhoncus at, volutpat ut lacus. Morbi pellentesque malesuada eros semper ultrices. Vestibulum lobortis enim vel neque auctor, a ultrices ex placerat. Mauris ut lacinia justo, sed suscipit tortor. Nam egestas nulla posuere neque."]
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text(verbatim: "last update: 14/08/2024")
          .font(.title3)
          .foregroundStyle(.skinFirtsLightGrayBlue)
          .fontweight(500)
          .hspacing(.leading)
        
        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor placerat a. Proin ac diam quam. Aenean in sagittis magna, ut feugiat diam. Fusce a scelerisque neque, sed accumsan metus.")
          .font(.subheadline)
          .foregroundStyle(.black)
          .fontweight(300)
        
        Text("Nunc auctor tortor in dolor luctus, quis euismod urna tincidunt. Aenean arcu metus, bibendum at rhoncus at, volutpat ut lacus. Morbi pellentesque malesuada eros semper ultrices. Vestibulum lobortis enim vel neque auctor, a ultrices ex placerat. Mauris ut lacinia justo, sed suscipit tortor. Nam egestas nulla posuere neque tincidunt porta.")
          .font(.subheadline)
          .foregroundStyle(.black)
          .fontweight(300)
        
        VStack(spacing: 25) {
          Text("Terms & Conditions")
            .font(.title)
            .fontweight(500)
            .hspacing(.leading)
            .foregroundStyle(.skinFirtsBlue)
          
          ForEach(terms.indices, id: \.self) { index in
            HStack(alignment: .top) {
              Text("\(index).")
              Text(terms[index])
            }
            .font(.subheadline)
            .foregroundStyle(.black)
            .lineSpacing(2)
            .fontweight(300)
          }
        }
      }
      .padding(.horizontal)
      .shortNavigationContent("Privacy Policy", dismiss: dismiss)
    }
  }
}

#Preview {
  NavigationStack {
    ProfilePrivacyPolicyView()
  }
}
