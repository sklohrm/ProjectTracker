//
//  AssetTest.swift
//  ProjectTrackerTests
//
//  Created by Spencer Lohrmann on 9/5/22.
//

import XCTest
@testable import ProjectTracker

class AssetTest: XCTestCase {

    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load '\(color)' from asset catalog.")
        }
    }

    func testJSONLoadsCorrectly() {
        XCTAssertFalse(Award.allAwards.isEmpty, "Failed to lead awards from JSON.")
    }
}
