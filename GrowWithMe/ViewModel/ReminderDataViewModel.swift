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
        ReminderDataModel(title: "Dişçi randevusu", subtitle: "Süt dişleri çekilecek", date: Date().addingTimeInterval(86400 * 10), note: "DentHospital", isChecked: false),
        ReminderDataModel(title: "Kişisel yetenekler 🎨", subtitle: "Çizim kitabı alınacak", date: Date().addingTimeInterval(86400 * 40), note: "Belki de çizim yeteneği vardır.", isChecked: true),
    ]
}
