//
//  ProjectTrackerTests.swift
//  ProjectTrackerTests
//
//  Created by Spencer Lohrmann on 9/5/22.
//

import CoreData
import XCTest
@testable import ProjectTracker

class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }

}
