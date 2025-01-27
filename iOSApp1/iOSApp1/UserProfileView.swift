//
//  UserProfileView.swift
//  iOSApp1
//
//  Created by Jules Mickael on 2025-01-26.
//

import SwiftUI

struct UserProfileView: View {
    @State var user: User

    var body: some View {
        VStack {
            Text("\(user.name)'s Orders")
                .font(.largeTitle)
                .padding()

            List(user.orderHistory) { order in
                VStack(alignment: .leading) {
                    Text(order.drinkType)
                        .font(.headline)
                    Text(order.size)
                        .font(.subheadline)
                    Text(order.customizations.joined(separator: ", "))
                        .font(.footnote)
                }
            }

            NavigationLink(destination: OrderCreationView(user: $user)) {
                Text("Add New Order")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .navigationTitle(user.name)
    }
}

