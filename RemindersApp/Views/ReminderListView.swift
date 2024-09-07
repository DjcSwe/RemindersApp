//
//  ReminderListView.swift
//  RemindersApp
//
//  Created by DJC on 9/6/24.
//

import SwiftUI

struct ReminderListView: View {
    
    let reminders: FetchedResults<Reminder>
    
    var body: some View {
        List(reminders) { reminder in
            ReminderCellView(reminder: reminder)
        }
    }
    
}

//#Preview {
//    ReminderListView()
//}
