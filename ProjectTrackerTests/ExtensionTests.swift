//
//  ExtensionTests.swift
//  ProjectTrackerTests
//
//  Created by Spencer Lohrmann on 9/7/22.
//

import SwiftUI
import XCTest
@testable import ProjectTracker

class ExtensionTests: XCTestCase {

    // MARK: Sequence

    func testSequenceKeyPathSortingSelf() {
        let items = [1, 2, 4, 5, 3]
        let sortedItems = items.sorted(by: \.self)

        XCTAssertEqual(sortedItems, [1, 2, 3, 4, 5], "The sorted numbers should be ascending.")
    }

    func testSequenceKeyPathSortingCustom() {
        struct Example: Equatable {
            let value: String
        }

        let example1 = Example(value: "a")
        let example2 = Example(value: "b")
        let example3 = Example(value: "c")

        let array = [example1, example2, example3]

        let sortedItems = array.sorted(by: \.value) {
            $0 > $1
        }

        XCTAssertEqual(sortedItems, [example3, example2, example1], "Reverse sorting should yield c, b, a.")
    }

    // MARK: Bundle

    func testBundleDecodingAwards() {
        let awards = Bundle.main.decode([Award].self, from: "Awards.json")

        XCTAssertFalse(awards.isEmpty, "Awards.json should decode to non-empty array")
    }

    func testDecodingString() {
        let bundle = Bundle(for: ExtensionTests.self)
        let data = bundle.decode(String.self, from: "DecodableString.json")

        XCTAssertEqual(data, "The pelagic argosy sights land.", "String must match DecodableString.json.")
    }

    func testDecodingDictionary() {
        let bundle = Bundle(for: ExtensionTests.self)
        let data = bundle.decode(Dictionary<String, Int>.self, from: "DecodableDictionary.json")

        XCTAssertEqual(data, ["One": 1, "Two": 2, "Three": 3], "Dictionary must match DecodableDictionary.json.")
    }

    // MARK: Binding

    func testBindingOnChangeCallsFunction() {
        // Given
        var onChangeFunctionRun = false

        func exampleFunctionToCall() {
            onChangeFunctionRun = true
        }

        var storedValue = ""

        let binding = Binding(
            get: { storedValue},
            set: { storedValue = $0 }
        )

        let changedBinding = binding.onChange(exampleFunctionToCall)

        // When
        changedBinding.wrappedValue = "Test"

        // Then
        XCTAssertTrue(onChangeFunctionRun, "The onChange() function must be run when the binding is changed.")
    }
}
