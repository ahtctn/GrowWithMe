//
//  SpecialMomentsDataModel.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

//import Foundation
//import SwiftUI
//
//struct SpecialMomentsDataModel: Identifiable, Codable {
//    var id = UUID().uuidString
//    var title: String
//    var image: Image
//    var subtitle: String
//    var date: Date
//}

import Foundation
import SwiftUI

struct SpecialMomentsDataModel: Identifiable, Codable {
    var id = UUID().uuidString
    var title: String
    var imageData: Data?
    var subtitle: String
    var date: Date

    // image özelliğini, imageData kullanarak dönüştürme
    var image: Image? {
        if let data = imageData, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
        return nil
    }

    // UIImage'yi kullanarak SpecialMomentsDataModel oluşturmak için yardımcı bir inits
    init(title: String, image: UIImage?, subtitle: String, date: Date) {
        self.title = title
        self.imageData = image?.jpegData(compressionQuality: 1.0)
        self.subtitle = subtitle
        self.date = date
    }
}
