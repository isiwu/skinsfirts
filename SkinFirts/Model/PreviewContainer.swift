//
//  PreviewContainer.swift
//  SkinFirts
//
//  Created by Emmanuel Isiwu on 13/06/2025.
//

import SwiftData


@MainActor
let previewContainer: ModelContainer = {
  do {
    let container = try ModelContainer(for: Doctor.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    let modelContext = container.mainContext
    
    if try modelContext.fetch(FetchDescriptor<Doctor>()).isEmpty {
      SampleData.doctors.forEach { container.mainContext.insert($0)}
    }
    
    return container
  } catch {
    fatalError("Failed to create container")
  }
}()
