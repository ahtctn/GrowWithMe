//
//  StoryImageView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 25.03.2024.
//

import SwiftUI

struct StoryImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 320, height: 320)
            .ignoresSafeArea()
            .background(.gray)
            .cornerRadius(12)
    }
}

#Preview {
    StoryImageView(imageName: "gece")
    
}
