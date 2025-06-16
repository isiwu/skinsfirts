//
//  ProfileCurrentView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI

struct ProfileCurrentView: View {
  @State private var showSheet = false

  var body: some View {
    ZStack {
      Button("Present") {
        showSheet.toggle()
      }
      .font(.largeTitle)
      
      if showSheet {
//        ZStack {
//          Button {
//            showSheet.toggle()
//          } label: {
//            Image(systemName: "xmark.circle")
//              .font(.largeTitle)
//              .foregroundColor(.gray)
//          }
//          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
//          .padding()
//        }
//        .background(.ultraThickMaterial)
        VStack {
          Button {
            showSheet.toggle()
          } label: {
            Image(systemName: "xmark.circle")
              .font(.largeTitle)
              .foregroundColor(.gray)
          }
          .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
          .padding()
        }
        .background(Color.gray.opacity(0.5))
      }
    }
  }
}

struct PresentingSheetView: View {
   @State private var showSheet = false

   var body: some View {
       Button("Present") {
          showSheet.toggle()
       }.font(.largeTitle)
        .fullScreenCover(isPresented: $showSheet) {
              SheetView()
//          LogoutView()
       }
   }
}

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
 
     var body: some View {
    
         VStack {
            Button {
               presentationMode.wrappedValue.dismiss()
             } label: {
                Image(systemName: "xmark.circle")
                .font(.largeTitle)
                .foregroundColor(.gray)
             }
       }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding()
   }
}

#Preview {
  ProfileCurrentView()
}

#Preview("2") {
  PresentingSheetView()
}
