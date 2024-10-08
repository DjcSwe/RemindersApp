//
//  MyListDetailView.swift
//  RemindersApp
//
//  Created by DJC on 9/6/24.
//

import SwiftUI

struct MyListDetailView: View {
    
    let myList: MyList
    
    @State var addOpenReminder: Bool = false
    @State var title: String = ""
    
    @FetchRequest(sortDescriptors: [])
    private var reminderResults: FetchedResults<Reminder>
    
    private var isFormValid: Bool {
        !title.isEmpty
    }
    
    init(myList: MyList) {
        self.myList = myList
        _reminderResults = FetchRequest(fetchRequest: ReminderService.getRemindersByList(myList: myList))
    }
    
    
    
    var body: some View {
        VStack {
            // Display List of Reminders
            ReminderListView(reminders: reminderResults)
            
            HStack {
                Image(systemName: "plus.circle.fill")
                Button("New Reminder") {
                    addOpenReminder = true
                }
            }.foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }.alert("New Reminder", isPresented: $addOpenReminder) {
            TextField("", text: $title)
            Button("Cancel", role: .cancel) { }
            Button("Done") {
                if isFormValid {
                    // save reminder to My List
                    do {
                        try ReminderService.saveReminderToMyList(myList: myList, reminderTitle: title)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

#Preview {
    MyListDetailView(myList: PreviewData.myList)
}

