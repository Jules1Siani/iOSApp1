//
//  ContentView.swift
//  iOSApp1
//
//  Created by Jules Mickael on 2025-01-26.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Linear gradient background
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.red]), // Colors for the gradient
                    startPoint: .topLeading, // Starting point of the gradient
                    endPoint: .bottomTrailing // Ending point of the gradient
                )
                .ignoresSafeArea() // Extend gradient to the entire screen
                
                // Main content with text and navigation
                VStack {
                    Text("Welcome to Tim Hortons!")
                        .font(.largeTitle)
                        .foregroundColor(.white) // Make the text color white
                        .padding()

                    NavigationLink(destination: HomeView()) {
                        Text("Get Started")
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


