//
//  ContentView.swift
//  RemindersApp
//
//  Created by DJC on 9/4/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresented: Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                Text("Hello World")
                Button {
                    isPresented = true
                } label: {
                    Text("Add List")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .font(.headline)
                }.padding()
            }.sheet(isPresented: $isPresented) {
                NavigationView {
                    AddNewListView { name, color in
                        // Save the list to the local database
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
