//
//  cocoaheads_swiftui_workshopApp.swift
//  cocoaheads-swiftui-workshop
//
//  Created by Mauricio Cardozo on 03/07/24.
//

import SwiftUI
import SwiftData

@main
struct cocoaheads_swiftui_workshopApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
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
}
