//
//  DevelopmentTests.swift
//  ProjectTrackerTests
//
//  Created by Spencer Lohrmann on 9/6/22.
//

import CoreData
import XCTest
@testable import ProjectTracker

class DevelopmentTests: BaseTestCase {

    func testSampleDataCreation() throws {
        try dataController.createSampleData()

        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), 5, "There should be 5 samples projects.")
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), 50, "There should be 50 items.")
    }

    func testDeleteAll() throws {
        try dataController.createSampleData()

        dataController.deleteAll()

        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), 0, "There should be 0 projects.")
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), 0, "There should be 0 items.")
    }

    func testExampleProjectIsClosed() {
        let project = Project.example
        XCTAssertTrue(project.closed, "The example project should be closed.")
    }

    func testExampleItemIsHighPriority() {
        let item = Item.example
        XCTAssertEqual(item.priority, 3, "Item should be high priority.")
    }
}
