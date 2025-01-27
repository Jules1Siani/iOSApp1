//
//  User.swift
//  iOSApp1
//
//  Created by Jules Mickael on 2025-01-26.
//

import Foundation

// Model for a user
struct User: Identifiable, Codable {
    var id: UUID = UUID() // Unique identifier for the user
    var name: String // User's name
    var orderHistory: [CoffeeOrder] // List of all orders for the user
}
