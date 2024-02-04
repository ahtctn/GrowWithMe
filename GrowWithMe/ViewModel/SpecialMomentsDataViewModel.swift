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
        SpecialMomentsDataModel(title: "İlk adım", image: Image("firstStep"), subtitle: "Mükemmel bir gündü, kızımızın büyüdüğünü bu uygulama sayesinde gözlerimizle görebiliyoruz.", date: Date().addingTimeInterval(86400 * 20)),
        SpecialMomentsDataModel(title: "İlk adım", image: Image("firstStep"), subtitle: "Mükemmel bir gündü, kızımızın büyüdüğünü bu uygulama sayesinde gözlerimizle görebiliyoruz.", date: Date().addingTimeInterval(86400 * 20)),
        SpecialMomentsDataModel(title: "Tech genius", image: Image("tech"), subtitle: "Sanırım dahi olacak", date: Date().addingTimeInterval(86400 * 20)),
    ]
}
