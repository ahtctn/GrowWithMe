//
//  SpecialMomentsDataViewModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import Foundation
import SwiftUI

class SpecialMomentsDataViewModel: ObservableObject {
    @Published var specialMomentsData: [SpecialMomentsDataModel] = []
    
    @Published var isAddSpecialMomentsPresented: Bool = false
    init() {
        loadSpecialMoments()
    }
    
    func presentAddSpecialMomentsView() {
        isAddSpecialMomentsPresented = true
    }
    
    func addSpecialMomentsData(_ dataModel: SpecialMomentsDataModel) {
        specialMomentsData.append(dataModel)
        updateSpecialMoments()
    }
    
    func updateSpecialMoments() {
        saveSpecialMoments()
        DispatchQueue.main.async {
            self.objectWillChange.send()
            self.loadSpecialMoments()
        }
    }
    
    func saveSpecialMoments() {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(specialMomentsData)
            UserDefaults.standard.setValue(encodedData, forKey: "specialMoments")
        } catch {
            print("Error encoding special moments: \(error.localizedDescription)")
        }
    }
    
    func loadSpecialMoments() {
        if let data = UserDefaults.standard.data(forKey: "specialMoments") {
            do {
                specialMomentsData = try JSONDecoder().decode([SpecialMomentsDataModel].self, from: data)
            } catch {
                print("Error decoding special moments: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteSpecialMoments(_ specialMoment: SpecialMomentsDataModel) async {
        if let index = specialMomentsData.firstIndex(where: {$0.id == specialMoment.id} ) {
            specialMomentsData.remove(at: index)
            updateSpecialMoments()
        }
    }
}
