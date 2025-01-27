//
//  OrderCreationView.swift
//  iOSApp1
//
//  Created by Jules Mickael on 2025-01-26.
//

import SwiftUI

struct OrderCreationView: View {
    @Binding var user: User // Reference to the user being updated

    // State variables for order details
    @State private var drinkType: String = "Coffee" // Default drink type
    @State private var size: String = "Medium" // Default size
    @State private var customizations: [String] = [] // List of customizations
    @State private var notes: String = ""

    // Predefined options for drink types and sizes
    let drinkTypes = ["Coffee", "Latte", "Tea", "Hot Chocolate", "Espresso"]
    let sizes = ["Small", "Medium", "Large"]

    var body: some View {
        Form {
            // Picker for selecting a drink type
            Section(header: Text("Select Drink Type")) {
                Picker("Drink Type", selection: $drinkType) {
                    ForEach(drinkTypes, id: \.self) { type in
                        Text(type) // Display each drink type
                    }
                }
                .pickerStyle(MenuPickerStyle()) // Dropdown style picker
            }

            // Picker for selecting a size
            Section(header: Text("Select Size")) {
                Picker("Size", selection: $size) {
                    ForEach(sizes, id: \.self) { size in
                        Text(size) // Display each size option
                    }
                }
                .pickerStyle(SegmentedPickerStyle()) // Segmented control style
            }

            // TextField for additional customizations (comma-separated)
            Section(header: Text("Customizations")) {
                TextField("Enter customizations (comma-separated)", text: Binding(
                    get: { customizations.joined(separator: ", ") },
                    set: { customizations = $0.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) } }
                ))
            }

            // TextField for additional notes
            Section(header: Text("Notes")) {
                TextField("Add any notes", text: $notes)
            }

            // Button to save the order
            Button(action: {
                saveOrder() // Save the order
            }) {
                Text("Save Order")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationTitle("Create Order")
    }

    // Function to save the order to the user's profile
    func saveOrder() {
        // Create a new order with the selected details
        let newOrder = CoffeeOrder(
            name: user.name,
            drinkType: drinkType,
            size: size,
            customizations: customizations,
            notes: notes
        )

        // Add the order to the user's history
        user.orderHistory.append(newOrder)

        // Save the updated user list to local storage
        LocalStorage.shared.saveUsers([user])
    }
}
