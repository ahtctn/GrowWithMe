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
        PhysicalDataModel(weight: 6.2, length: 1.7, date: Date().addingTimeInterval(86400 * 25)),
        
    ]
}
