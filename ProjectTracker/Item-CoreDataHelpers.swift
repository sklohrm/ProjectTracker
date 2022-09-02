//
//  Item-CoreDataHelpers.swift
//  ProjectTracker
//
//  Created by Spencer Lohrmann on 8/28/22.
//

import Foundation

extension Item {
    var itemTitle: String {
        title ?? NSLocalizedString("New Item", comment: "Create a new item")
    }

    var itemDetail: String { detail ?? "" }

    var itemCreationDate: Date { creationDate ?? Date() }

    enum SortOrder {
        case optimized, title, creationDate
    }

// MARK: - Testing

    static var example: Item {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let item = Item(context: viewContext)
        item.title = "Example Item"
        item.detail = "This is an example item."
        item.priority = 3
        item.creationDate = Date()

        return item
    }
}
