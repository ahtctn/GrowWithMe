//
//  ReminderDataViewModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import Foundation

class ReminderDataViewModel: ObservableObject {
    @Published var reminderData: [ReminderDataModel] = []
    
    @Published var isAddReminderPresented: Bool = false
    
    init() {
        loadReminders()
    }
    
    func presentAddReminder() {
        isAddReminderPresented = true
    }
    
    func addReminderData(_ dataModel: ReminderDataModel) {
        reminderData.append(dataModel)
        updateReminders()
    }
    
    func loadReminders() {
        if let data = UserDefaults.standard.data(forKey: "reminders") {
            do {
                reminderData = try JSONDecoder().decode([ReminderDataModel].self, from: data)
            } catch {
                print("Error decoding expenses: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteExpense(_ reminder: ReminderDataModel) async {
        if let index = reminderData.firstIndex(where: { $0.id == reminder.id }) {
            reminderData.remove(at: index)
            updateReminders()
            
        }
    }
    
    func updateReminders() {
        saveReminders()
        DispatchQueue.main.async {
            self.objectWillChange.send()
            self.loadReminders()
        }
    }
    
    func saveReminders() {
        do {
            let encodedData = try JSONEncoder().encode(reminderData)
            UserDefaults.standard.set(encodedData, forKey: "reminders")
        } catch {
            print("Error encoding reminders: \(error.localizedDescription)")
        }
    }

}

