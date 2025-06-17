//
//  NotificationView.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 16/06/2025.
//

import SwiftUI
import SwiftData

struct NotificationView: View {
  @Environment(\.dismiss) var dismiss
  @Query var notifications: [Notification]
  var sections = [
    SectionData(text: "Today", date: Date()),
    SectionData(text: "Yesterday", date: Date(timeIntervalSinceNow: -86400)),
    SectionData(text: "2 June", date: Date(timeIntervalSinceNow: -259200))
  ]
  var body: some View {
    List {
      ForEach(sections.indices, id: \.self) { index in
        Section(header: Text(sections[index].text).font(.title).foregroundStyle(.skinFirtsBlue).padding(.horizontal, 40).padding(.vertical, 8).background(Color.skinFirtsGrayBlue, in: .rect(cornerRadius: 30))) {
          ForEach(notifications) { notification in
            if notification.date.isToday && sections[index].date.isToday  {
              HStack {
                NotificationMessageView(notification: notification)
              }
            } else if notification.date.isYesterday && sections[index].date.isYesterday {
              HStack {
                NotificationMessageView(notification: notification)
              }
            } else if notification.date.isMorePastDate && sections[index].date.isMorePastDate {
              HStack {
                NotificationMessageView(notification: notification)
              }
            }
          }
          .listRowSeparator(.hidden)
          .listRowBackground(Color.white)
        }
      }
    }
    .listStyle(.plain)
    .listRowSpacing(30)
    .navigationBarBackButtonHidden(true)
    .shortNavigationContent("Notification", dismiss: dismiss)
    .toolbarBackground(Color.white, for: .navigationBar)
    .toolbarTitleDisplayMode(.inline)
  }
  
  func NotificationMessageView(notification: Notification) -> some View {
    HStack(alignment: .top) {
      if notification.category == .schedule {
        Image("calendar")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .padding(.all, 10)
          .background(Color.skinFirtsBlue, in: .circle)
          .frame(width: 50, height: 50)
      } else if notification.category == .note {
        Image("note")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .padding(.all, 10)
          .background(Color.skinFirtsBlue, in: .circle)
          .frame(width: 50, height: 50)
      } else if notification.category == .history {
        Image("history")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .padding(.all, 10)
          .background(Color.skinFirtsBlue, in: .circle)
          .frame(width: 50, height: 50)
      }
      
      VStack(alignment: .leading) {
        Text(notification.title)
          .font(.title2)
          .fontweight(600)
        Text(notification.message)
          .font(.body)
          .fontweight(200)
      }
    }
  }
}

struct SectionData {
  var text: String
  var date: Date
}

#Preview {
  NavigationStack {
    NotificationView()
      .modelContainer(previewContainer)
  }
}
