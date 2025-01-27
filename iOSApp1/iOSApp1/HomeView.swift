//
//  HomeView.swift
//  iOSApp1
//
//  Created by Jules Mickael on 2025-01-26.
//

import SwiftUI

struct HomeView: View {
    // State variables to hold the list of users and the new user's name
    @State private var users: [User] = LocalStorage.shared.fetchUsers() // Fetch saved users from local storage
    @State private var newUserName: String = "" // Temporary storage for the new user's name

    var body: some View {
        NavigationView {
            VStack {
                // App title
                Text("Coffee Run")
                    .font(.largeTitle)
                    .padding()

                // List to display existing users
                List(users) { user in
                    NavigationLink(destination: UserProfileView(user: user)) {
                        Text(user.name) // Display each user's name
                    }
                }

                // Section to add a new user
                VStack(spacing: 10) {
                    // TextField for entering a new user's name
                    TextField("Enter user name", text: $newUserName)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) // Rounded border for better UI
                        .padding()

                    // Button to add the user
                    Button(action: {
                        addUser() // Call the addUser function when clicked
                    }) {
                        Text("Add User") // Button text
                            .padding()
                            .frame(maxWidth: .infinity) // Full-width button
                            .background(Color.blue) // Blue background color
                            .foregroundColor(.white) // White text color
                            .cornerRadius(10) // Rounded corners
                            .padding(.horizontal) // Add padding on the sides
                    }
                }
                .padding() // Add padding around the section

                // Button to clear all saved users
                Button("Clear All Users") {
                    LocalStorage.shared.clearUsers()
                    users = [] // Clear the UI list
                    print("All users cleared.") // Print confirmation in the console
                }
                .padding()

                Spacer() // Push content to the top
            }
            .navigationTitle("Team Orders") // Title for the navigation bar
        }
    }

    // Function to add a new user
    func addUser() {
        // Ensure the user name is not empty
        guard !newUserName.isEmpty else { return }

        // Create a new user with the provided name and an empty order history
        let newUser = User(name: newUserName, orderHistory: [])

        // Add the new user to the list of users
        users.append(newUser)

        // Save the updated list of users to local storage
        LocalStorage.shared.saveUsers(users)

        // Clear the text field after the user is added
        newUserName = ""
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


