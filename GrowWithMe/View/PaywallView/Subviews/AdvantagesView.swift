//
//  AdvantagesView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct AdvantagesView: View {
    let imageName: String
    let name: String
    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(name)
        }
    }
}

#Preview {
    AdvantagesView(imageName: "person.fill", name: "Ahmet Ali Çetin")
}
