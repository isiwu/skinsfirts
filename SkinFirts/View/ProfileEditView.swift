//
//  EditProfileView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI

struct ProfileEditView: View {
  @Environment(\.dismiss) var dismiss
  var title = "Profile"
  @Bindable var person = ProfileEditViewModel()
  @State private var showDate = false
  var body: some View {
    ScrollView {
      VStack {
        ProfileLogoEditView()
        
        VStack(spacing: 25) {
          TextInputView(label: "Full Name", text: $person.fullName)
          
          TextInputView(label: "Phone Number", text: $person.phone)
          
          TextInputView(label: "Email", text: $person.email)
          
          VStack(alignment: .leading, spacing: 8) {
            Text("Date of Birth")
              .font(.title)
              .fontweight(500)
            
            Text(person.dob.format("dd/MM/YYYY"))
              .hspacing(.leading)
              .padding(.vertical, 10)
              .padding(.horizontal, 20)
              .font(.system(size: 30))
              .background(Color.fieldText2, in: .rect(cornerRadius: 20))
              .onTapGesture(perform: {
                showDate.toggle()
              })
              .popover(isPresented: $showDate, content: {
                DatePicker("", selection: $person.dob, displayedComponents: [.date])
                  .datePickerStyle(.graphical)
                  .frame(minWidth: 300, maxHeight: 400)
                  .presentationCompactAdaptation(.popover)
                  .onChange(of: person.dob) {
                    showDate.toggle()
                  }
              })
          }
        }
      }
      .padding(.horizontal)
      .navigationBarBackButtonHidden(true)
      .toolbar(content: {
        ToolbarItem(placement: .topBarLeading) {
          Image("arrowback")
            .overlay(content: {
              Circle()
                .frame(width: 40, height: 40)
                .background()
                .blendMode(.destinationOver)
                .onTapGesture(perform: {
                  dismiss()
                })
            })
        }
        
        ToolbarItem(placement: .principal) {
          Text(title)
            .foregroundStyle(.skinFirtsBlue)
            .font(.title)
            .fontweight(600)
        }
      })
    }
  }
  
  func ProfileLogoEditView() -> some View {
    HStack {
      Spacer()

      VStack {
        ZStack {
          Image("profile")
            .resizable()
            .aspectRatio(1, contentMode: .fill)
            .frame(width: 130, height: 130)
          
          Image("edit")
            .resizable()
            .aspectRatio(1, contentMode: .fill)
            .frame(width: 25, height: 20)
            .padding(.all, 10)
            .background(Color.skinFirtsBlue, in: .circle)
            .offset(x: 50, y: 40)
        }
        Text("John Doe")
          .foregroundStyle(.black)
          .font(.largeTitle)
          .fontweight(600)
      }

      Spacer()
    }
  }
  
  func TextInputView(label: String, text: Binding<String>) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(label)
        .font(.title)
        .fontweight(500)
      
      TextField("", text: text)
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .font(.system(size: 30))
        .background(Color.fieldText2, in: .rect(cornerRadius: 20))
        .tint(.skinFirtsBlue)
    }
  }
}

#Preview {
  NavigationStack {
    ProfileEditView()
  }
}
