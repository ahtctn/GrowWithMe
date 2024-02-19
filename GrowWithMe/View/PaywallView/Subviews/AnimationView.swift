//
//  AnimationView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct AnimationView: View {
    var body: some View {
        ZStack {
            FirstCircleView()
            SecondCircleView()
            ThirdCircleView()
            LootieAnimationView(name: "baby", loopMode: .loop)
                .frame(width: 150, height: 150)
                
            
        }
        
        
        
        
        
    }
}

#Preview {
    AnimationView()
}





