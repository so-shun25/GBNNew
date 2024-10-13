//
//  GBNNewApp.swift
//  GBNNew
//
//  Created by 曽世田隼季 on 2024/09/14.
//

import SwiftUI
import SwiftData

@main
struct GBNNewApp: App {
    
    var sharedModelContainer: ModelContainer {
        let scehma = Schema([
            GBN.self
        ])
        let modelConfiguration = ModelConfiguration(schema: scehma, isStoredInMemoryOnly: false)
        let container = try! ModelContainer(for: scehma, configurations: modelConfiguration)
        return container
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MyFeedbackListView()
                    .tabItem { Text("one") }
                Text("test")
                    .tabItem { Text("two") }
                
            }
        }
        .modelContainer(sharedModelContainer)
    }
}

