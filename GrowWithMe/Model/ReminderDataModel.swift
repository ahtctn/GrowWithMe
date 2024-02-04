//
//  ReminderDataModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import Foundation

struct ReminderDataModel: Identifiable {
    var id = UUID().uuidString
    var title: String
    var subtitle: String
    var date: Date
    var note: String
    var isChecked: Bool
}
