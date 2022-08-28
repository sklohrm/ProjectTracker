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
        }
    }
}
