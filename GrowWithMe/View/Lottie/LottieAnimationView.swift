//
//  LottieAnimationView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 8.02.2024.
//

import Foundation
import Lottie
import SwiftUI
import UIKit

struct LootieAnimationView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    let name: String
    let loopMode: LottieLoopMode
    
    func makeUIView(context: UIViewRepresentableContext<LootieAnimationView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = loopMode
        animationView.play()
        
        view.addSubview(animationView)
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LootieAnimationView>) {
        
    }
}


