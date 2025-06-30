//
//  SkinFirtsApp.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 23/05/2025.
//

import SwiftUI
import SwiftData

@main
struct SkinFirtsApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Doctor.self,
            Faq.self,
            Service.self,
            Notification.self,
            Chat.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
  
  init() {
      let appearance = UINavigationBarAppearance()
      appearance.shadowColor = .clear
      UINavigationBar.appearance().standardAppearance = appearance
      UINavigationBar.appearance().scrollEdgeAppearance = appearance
  }
}
