//
//  ContentView.swift
//  RemindersApp
//
//  Created by DJC on 9/4/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPresented: Bool = false
    @FetchRequest(sortDescriptors: [])
    private var myListResults: FetchedResults<MyList>
    
    var body: some View {
        NavigationStack{
            VStack {
                
                MyListView(myLists: myListResults)

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
                        // Call reminder service
                        do {
                            try ReminderService.saveMyList(name, color)
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
}
