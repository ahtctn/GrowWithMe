//
//  AllAdvantagesView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct AllAdvantagesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            AdvantagesView(imageName: "pencil.tip.crop.circle.badge.plus.fill", name: "first_advantage".localized())
            AdvantagesView(imageName: "chart.pie.fill", name: "second_advantage".localized())
            AdvantagesView(imageName: "camera.fill", name: "third_advantage".localized())
            AdvantagesView(imageName: "music.mic.circle.fill", name: "fourth_advantage".localized())
        }
    }
}

#Preview {
    AllAdvantagesView()
}
