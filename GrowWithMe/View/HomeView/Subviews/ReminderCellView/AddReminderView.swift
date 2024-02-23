//
//  AddReminderView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 5.02.2024.
//

import SwiftUI

struct AddReminderView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var date = Date()
    @State private var note: String = ""
    
    @EnvironmentObject var reminderDataVM: ReminderDataViewModel
    var dismiss: () -> Void

    var body: some View {
        NavigationView {
            Form {
                TextField("title".localized(), text: $title)
                TextField("description".localized(), text: $description)
                TextField("note".localized(), text: $note)
                DatePicker(
                    "start_date".localized(),
                        selection: $date,
                        displayedComponents: [.date]
                    )
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            let reminderData = ReminderDataModel(title: title, subtitle: description, date: date, note: note, isChecked: false)
                            reminderDataVM.addReminderData(reminderData)
                            print(reminderData)                            
                        }
                        dismiss()
                    } label: {
                        Text("done".localized())
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            .navigationTitle("add_reminder".localized())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddReminderView(dismiss: {})
}
