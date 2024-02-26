//
//  PhysicalDataViewModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 30.01.2024.
//

import Foundation

class PhysicalDataViewModel: ObservableObject {
    @Published var data = [
        PhysicalDataModel(weight: 4, length: 0.5, date: Date()),
        PhysicalDataModel(weight: 4.2, length: 0.52, date: Date().addingTimeInterval(86400 * 5)),
        PhysicalDataModel(weight: 4.6, length: 0.59, date: Date().addingTimeInterval(86400 * 10)),
        PhysicalDataModel(weight: 5, length: 0.62, date: Date().addingTimeInterval(86400 * 15)),
        PhysicalDataModel(weight: 5.5, length: 0.7, date: Date().addingTimeInterval(86400 * 20)),
        PhysicalDataModel(weight: 6.2, length: 0.98, date: Date().addingTimeInterval(86400 * 25)),
        PhysicalDataModel(weight: 7, length: 1.1, date: Date().addingTimeInterval(86400 * 30)),
        PhysicalDataModel(weight: 8.2, length: 1.2, date: Date().addingTimeInterval(86400 * 35)),
        PhysicalDataModel(weight: 10.6, length: 1.39, date: Date().addingTimeInterval(86400 * 36)),
        PhysicalDataModel(weight: 12, length: 1.42, date: Date().addingTimeInterval(86400 * 40)),
        PhysicalDataModel(weight: 12.5, length: 1.52, date: Date().addingTimeInterval(86400 * 45)),
        PhysicalDataModel(weight: 13.2, length: 1.6, date: Date().addingTimeInterval(86400 * 55)),
        PhysicalDataModel(weight: 15, length: 1.61, date: Date().addingTimeInterval(86400 * 56)),
        PhysicalDataModel(weight: 17.2, length: 1.62, date: Date().addingTimeInterval(86400 * 60)),
        PhysicalDataModel(weight: 19.6, length: 1.69, date: Date().addingTimeInterval(86400 * 65)),
        PhysicalDataModel(weight: 20, length: 1.72, date: Date().addingTimeInterval(86400 * 70)),
        PhysicalDataModel(weight: 21.5, length: 1.73, date: Date().addingTimeInterval(86400 * 75)),
        PhysicalDataModel(weight: 23.2, length: 1.8, date: Date().addingTimeInterval(86400 * 80)),
        
    ]
    
    func calculateBMI(weight: Double, height: Double) -> Double {
        guard height > 0 else { return 0 }
        return weight / (height * height)
    }
    
}

