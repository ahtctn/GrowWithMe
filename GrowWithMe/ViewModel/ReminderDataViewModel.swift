//
//  ReminderDataViewModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import Foundation

class ReminderDataViewModel: ObservableObject {
    @Published var data = [
        ReminderDataModel(title: "Kuduz aşısı", subtitle: "Aşı olacak", date: Date().addingTimeInterval(86400 * 20), note: "Doktor Cavit Özyeğin", isChecked: true),
        ReminderDataModel(title: "Kuduz aşısı", subtitle: "Aşı olacak", date: Date().addingTimeInterval(86400 * 20), note: "Doktor Cavit Özyeğin", isChecked: false),
        ReminderDataModel(title: "Kuduz aşısı", subtitle: "Aşı olacak", date: Date().addingTimeInterval(86400 * 20), note: "Doktor Cavit Özyeğin", isChecked: true),
    ]
}
