//
//  LocalStorage.swift
//  iOSApp1
//
//  Created by Jules Mickael on 2025-01-26.
//
import Foundation

class LocalStorage {
    static let shared = LocalStorage() // Singleton instance for global access
    private let usersKey = "users" // Key for saving users in UserDefaults

    // Save the list of users to UserDefaults
    func saveUsers(_ users: [User]) {
        do {
            let data = try JSONEncoder().encode(users)
            UserDefaults.standard.set(data, forKey: usersKey)
            print("Users saved successfully.")
        } catch {
            print("Error encoding users: \(error)")
        }
    }

    // Fetch the list of users from UserDefaults
    func fetchUsers() -> [User] {
        if let data = UserDefaults.standard.data(forKey: usersKey) {
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                print("Users fetched successfully.")
                return users
            } catch {
                print("Error decoding users: \(error)")
            }
        } else {
            print("No users found in UserDefaults.")
        }
        return []
    }

    // Clear all saved users from UserDefaults
    func clearUsers() {
        UserDefaults.standard.removeObject(forKey: usersKey)
        print("All users cleared from storage.")
    }
}


