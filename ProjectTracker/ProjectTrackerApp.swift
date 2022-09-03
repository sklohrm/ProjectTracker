//
//  ProjectTrackerApp.swift
//  ProjectTracker
//
//  Created by Spencer Lohrmann on 8/25/22.
//

import SwiftUI

@main
struct ProjectTrackerApp: App {
    @StateObject var dataController: DataController

    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onReceive(
                    // Automatically save when we detect that we are no longer the foreground app.
                    // Use this rather than the scene phase API for MacOS compatability.
                    // Scene phase won't detect app losing focus as of MacOS 11.1.
                    NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification),
                    perform: save
                )
        }
    }

    func save(_ note: Notification) {
        dataController.save()
    }
}
