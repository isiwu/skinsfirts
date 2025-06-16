//
//  ProfileHelpView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftUI
import SwiftData

struct ProfileHelpView: View {
  @State private var status = "faq"
  @State private var topic = "popular"
  @State private var currentIndex = -1
  @State private var searchText = ""
  @Query var faqs: [Faq]
  @Query var services: [Service]
  @State private var currentFaqs = [Faq]()
  @Environment(\.dismiss) var dismiss
  var contacts = [
    ["icon": "headset", "text": "Customer service"],
    ["icon": "network", "text": "Website"],
    ["icon": "whatsapp", "text": "Whatsapp"],
    ["icon": "facebook", "text": "Facebook"],
    ["icon": "instagram", "text": "Instagram"],
  ]
  var body: some View {
    ScrollView {
      LazyVStack() {
        VStack {
          Text("how can we help you?")
            .foregroundStyle(.white)
          HStack {
            Image("search")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(height: 35)
            
            TextField("", text: $searchText, prompt: Text("search"))
              .padding(.vertical)
          }
          .padding(.horizontal)
          .background(Color.white, in: .rect(cornerRadius: 40))
          
        }
        .padding(.horizontal)
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(Color.skinFirtsBlue)
        
        VStack(spacing: 30) {
          VStack {
            HStack {
              MainButton(text: "FAQ", currentStatus: "faq")
              MainButton(text: "Contact Us", currentStatus: "contactUs")
            }
            
            HStack {
              TopicButton(text: "Popular Topic", currentTopic: "popular")
              TopicButton(text: "General", currentTopic: "general")
              TopicButton(text: "Services", currentTopic: "services")
            }
            .opacity(status=="faq" ? 1 : 0)
          }
          .padding(.top)
          
          VStack {
            if status == "faq" { // VIEW FOR FAQ
              if topic == "popular" || topic == "general" {
                ForEach(currentFaqs.indices, id: \.self) { index in
                  Topic(faq: currentFaqs[index], index)
                }
              } else if topic == "services" {
                ForEach(services.indices, id: \.self) { index in
                  Service(service: services[index], index)
                }
              }
            } else { // VIEW FOR CONTACT US
              ForEach(contacts.indices, id: \.self) { index in
                Contact(content: contacts[index])
              }
            }
          }
          .onAppear(perform: {
            if topic == "popular" {
              currentFaqs = faqs.filter { $0.popular == true }
            }
          })
          .onChange(of: topic) { _, _ in
            if topic == "general" {
              currentFaqs = faqs
            } else if topic == "popular" {
              currentFaqs = faqs.filter { $0.popular == true }
            }
          }
        }
        .padding(.horizontal)
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(content: {
      ToolbarItem(placement: .topBarLeading) {
        Image("arrowback-white")
          .onTapGesture(perform: {
            dismiss()
          })
      }
      
      ToolbarItem(placement: .principal) {
        Text("Help Center")
          .foregroundStyle(.white)
          .font(.title)
          .fontweight(600)
      }
    })
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(Color.skinFirtsBlue, for: .navigationBar)
    .toolbarTitleDisplayMode(.inline)
  }
  
  func MainButton(text: String, currentStatus: String) -> some View {
    Button(action: {
      self.status = currentStatus
    }) {
      Text(text)
        .foregroundStyle(self.status==currentStatus ? .white : .skinFirtsBlue)
        .font(.title)
        .fontweight(400)
        .frame(width: 175, height: 61)
        .background(self.status==currentStatus ? Color.skinFirtsBlue : Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 40))
    }
  }
  
  func TopicButton(text: String, currentTopic: String) -> some View {
    Button(action: {
      self.topic = currentTopic
    }) {
      Text(text)
        .foregroundStyle(self.topic==currentTopic ? .white : .skinFirtsBlue)
        .font(.body)
        .fontweight(400)
        .frame(width: 115, height: 40)
        .background(self.topic==currentTopic ? Color.skinFirtsBlue : Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 40))
    }
  }
  
  func Topic(faq: Faq, _ index: Int) -> some View {
    VStack {
      HStack {
        Text(faq.topic)
          .font(.custom("LeagueSpartan", size: 20))
          .font(.title3)
          .fontweight(600)
          .foregroundStyle(.black)
        
        Spacer()
        
        Image(systemName: "lessthan")
          .foregroundStyle(.skinFirtsBlue)
          .rotationEffect(.degrees(-90))
          .font(.title)
          .padding(.all, 4)
          .background(Color.white, in: .circle)
      }
      .padding(.horizontal, 15)
      .padding(.vertical)
      .frame(maxWidth: .infinity)
      .background(Color.fieldText2, in: .rect(cornerRadius: 30))
      .onTapGesture(perform: {
        withAnimation(.snappy) {
          if currentIndex == index {
            currentIndex = -1
          } else {
            currentIndex  = index
          }
        }
      })
      
      if index == currentIndex {
        Text(faq.desc)
          .font(.body)
          .fontweight(200)
          .padding(.all, 25)
          .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 20))
          .padding(.top)
      }
    }
  }
  
  func Service(service: Service, _ index: Int) -> some View {
    VStack {
      HStack {
        HStack {
          Image(systemName: "heart.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
          
          Text(service.name)
            .font(.custom("LeagueSpartan", size: 20))
            .font(.title3)
            .fontweight(600)
        }
        .foregroundStyle(.white)
        
        Spacer()
        
        Image(systemName: "lessthan")
          .foregroundStyle(.skinFirtsBlue)
          .rotationEffect(.degrees(-90))
          .font(.title)
          .padding(.all, 4)
          .background(Color.white, in: .circle)
      }
      .padding(.horizontal, 15)
      .padding(.vertical)
      .frame(maxWidth: .infinity)
      .background(Color.skinFirtsBlue, in: .rect(cornerRadius: 30))
      .onTapGesture(perform: {
        withAnimation(.snappy) {
          if currentIndex == index {
            currentIndex = -1
          } else {
            currentIndex  = index
          }
        }
      })
      
      if index == currentIndex {
        VStack {
          Text(service.desc)
            .font(.body)
            .fontweight(200)
            .padding(.all, 25)
            .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 20))
          
          Text("looking doctors")
            .font(.title)
            .fontweight(500)
            .foregroundStyle(.skinFirtsBlue)
            .padding(.vertical, 15)
            .frame(maxWidth: .infinity)
            .background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 40))
        }
        .padding(.top)
      }
    }
  }
  
  func Contact(content: [String: String]) -> some View {
    HStack {
      HStack {
        Image(content["icon"]!)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 35, height: 35)
          .padding(.all, 10)
          .foregroundStyle(.skinFirtsBlue)
          .background(Color.skinFirtsGrayBlue, in: .circle)
//                  Image(systemName: "wallet.bifold")
        
        Text(content["text"]!)
          .font(.title)
          .fontweight(400)
      }
      
      Spacer()
      
      Image(systemName: "greaterthan")
        .font(.system(size: 25))
        .foregroundStyle(.skinFirtsBlue)
        .rotationEffect(.degrees(90))
    }

  }
}

#Preview {
  NavigationStack {
    ProfileHelpView()
      .modelContainer(previewContainer)
  }
}
