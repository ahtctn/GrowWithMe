//
//  MyChildDataModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import Foundation
import SwiftUI

struct MyChildDataModel: Identifiable, Codable {
    var id = UUID().uuidString
    var name: String
    var height: String
    var weight: String
    var birthDate: Date
    var imageData: Data?
    var image: Image? {
        if let data = imageData, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
        return nil
    }
    var isPremium: Bool
    
    init(name: String, height: String, weight: String, birthDate: Date, image: UIImage?, isPremium: Bool) {
        
        self.name = name
        self.height = height
        self.weight = weight
        self.birthDate = birthDate
        self.imageData = image?.jpegData(compressionQuality: 1.0)
        self.isPremium = isPremium
    }
    
}
