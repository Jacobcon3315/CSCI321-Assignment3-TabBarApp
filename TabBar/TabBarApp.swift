//
//  TabBarApp.swift
//  TabBar
//
//  Created by Madi Lumsden on 10/24/22.
//

import SwiftUI

@main
struct TabBarApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
