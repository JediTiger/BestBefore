//
//  Best_BeforeApp.swift
//  Shared
//
//  Created by Thor Lindberg on 22/01/2021.
//

import SwiftUI

@main
struct Best_BeforeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
