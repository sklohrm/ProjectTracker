//
//  PerformanceTests.swift
//  ProjectTrackerTests
//
//  Created by Spencer Lohrmann on 9/8/22.
//

import CoreData
import XCTest
@testable import ProjectTracker

final class PerformanceTests: BaseTestCase {
    func testAwardCalculationPerformance() throws {
        // Create a significant amount of test data
        for _ in 1...100 {
            try dataController.createSampleData()
        }

        // Simulate a significant amount of awards to check
        let awards = Array(repeating: Award.allAwards, count: 25).joined()

        XCTAssertEqual(awards.count, 500, "Number of awards should be constant. Change if new awards are added.")

        measure {
            _ = awards.filter(dataController.hasEarned)
        }
    }
}
