//
//  MessageView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 17/06/2025.
//

import SwiftUI
import SwiftData

struct MessageView: View {
  @Environment(\.dismiss) var dismiss
  @State private var chat = ""
  @Query var chats: [Chat]
  var body: some View {
    ScrollViewReader { proxy in
      VStack {
        ScrollView {
          LazyVStack {
            ForEach(chats.indices, id: \.self) { index in
              ChatItemView(chat: chats[index])
                .id(chats[index])   // FOR SCROLLING TO THE LAST
                .padding(.top, index != 0 && chats[index].sender.rawValue != chats[index - 1].sender.rawValue ? 40 : 0)
            }
            .onAppear(perform: {
              proxy.scrollTo(chats.last)
            })
          }
          .padding(.horizontal)
        }
        
        Spacer()
        
        HStack {
          Spacer()
          HStack {
            Image("upload")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 30, height: 30)
              .foregroundStyle(.white)
              .padding(.all, 8)
              .background(Color.white, in: .circle)
            
            HStack {
              TextField("", text: $chat, prompt: Text("Type a message").foregroundStyle(.skinFirtsGrayBlue))
              
              Button(action: {}) {
                Image("microphone")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 35, height: 35)
                  .foregroundStyle(.skinFirtsBlue)
              }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.white, in: .rect(cornerRadius: 30))
            
            Button(action: {}) {
              Image("sender")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .padding(.all, 8)
                .background(Color.skinFirtsBlue, in: .circle)
            }
          }
          Spacer()
        }
        .padding(.horizontal)
        .padding(.top)
        .background(.skinFirtsGrayBlue)
      }
    }
    .navigationBarBackButtonHidden(true)
    .toolbar(content: {
      ToolbarItem(placement: .topBarLeading) {
        HStack(spacing: 20) {
          Image("arrowback-white")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 16, height: 20)
            .onTapGesture(perform: {
              dismiss()
          })
          
          Text("Dr. Olivia Tuner")
            .foregroundStyle(.white)
            .font(.title)
            .fontweight(600)
        }
      }
      
      ToolbarItem(placement: .topBarTrailing) {
        HStack {
          Image("phone")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 23, height: 23)
            .padding(.all, 6)
            .background(Color.white, in: .circle)
          
          Image("video")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 23, height: 23)
            .padding(.all, 6)
            .background(Color.white, in: .circle)
        }
      }
    })
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(Color.skinFirtsBlue, for: .navigationBar)
    .toolbarTitleDisplayMode(.inline)
  }
  
  func ChatItemView(chat: Chat) -> some View {
    VStack {
      VStack {
        if chat.messageType.rawValue == "text" {
          Text(chat.body)
        } else {
          Image(chat.body)
        }
      }
      .padding(.all)
      .background(chat.sender.rawValue == "owner" ? Color.skinFirtsGrayBlue : Color.fieldText2, in: .rect(cornerRadius: 30))
    }
    .padding(chat.sender.rawValue == "owner" ? .leading : .trailing, 90)
  }
}

#Preview {
  NavigationStack {
    MessageView()
      .modelContainer(previewContainer)
  }
}
