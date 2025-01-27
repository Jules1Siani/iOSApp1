//
//  CoffeeOrder.swift
//  iOSApp1
//
//  Created by Jules Mickael on 2025-01-26.
//

import Foundation

// Model for a coffee order
struct CoffeeOrder: Identifiable, Codable {
    var id: UUID = UUID() // Unique identifier for the order
    var name: String // User's name for the order
    var drinkType: String // Type of drink (e.g., Coffee, Tea, Latte)
    var size: String // Size (Small, Medium, Large)
    var customizations: [String] // List of customizations
    var notes: String // Additional notes
}
