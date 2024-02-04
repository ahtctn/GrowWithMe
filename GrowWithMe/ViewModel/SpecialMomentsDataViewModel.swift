//
//  SpecialMomentsDataViewModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import Foundation
import SwiftUI

class SpecialMomentsDataViewModel: ObservableObject {
    @Published var data = [
        SpecialMomentsDataModel(title: "İlk adım", image: Image("firstStep"), subtitle: "Mükemmel bir gün.", date: Date().addingTimeInterval(86400 * 20)),
        SpecialMomentsDataModel(title: "Kitap kurdu", image: Image("reading"), subtitle: "O bir dahi", date: Date().addingTimeInterval(86400 * 10)),
        SpecialMomentsDataModel(title: "Tech genius", image: Image("tech"), subtitle: "Okumayı seviyor.", date: Date().addingTimeInterval(86400 * 20)),
        SpecialMomentsDataModel(title: "İlk adım", image: Image("firstStep"), subtitle: "Mükemmel bir gün.", date: Date().addingTimeInterval(86400 * 20)),
    ]
}
