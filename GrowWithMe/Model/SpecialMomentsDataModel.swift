//
//  SpecialMomentsDataModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import Foundation
import SwiftUI

struct SpecialMomentsDataModel: Identifiable {
    var id = UUID().uuidString
    var title: String
    var image: Image
    var subtitle: String
    var date: Date
}
