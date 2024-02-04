//
//  ReminderView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import SwiftUI

struct ReminderView: View {
    @ObservedObject var reminderDataVM = ReminderDataViewModel()
    @State private var isChecked: Bool = false
    
    var body: some View {
        Section("Reminders") {
            ForEach($reminderDataVM.data) { $data in
                let formattedDate = DateFormatter.customDateFormatter.string(from: data.date)
                RemindersCellView(title: data.title, subtitle: data.subtitle, date: formattedDate, note: data.note, isChecked: $data.isChecked)
            }
        }
    }
}

#Preview {
    ReminderView()
}
