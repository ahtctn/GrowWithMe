//
//  CircularProgressView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 25.03.2024.
//

import SwiftUI

struct CircularProgressView: View {
    var circleWidth: Double
    var circleHeight: Double
    @Binding var progress: Double
    
    var body: some View {
        
        Circle()
            .trim(from: 0.0, to: progress)
            .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round))
            .foregroundStyle(.orange)
            .animation(.linear(duration: 0.5))
            .frame(width: circleWidth, height: circleHeight, alignment: .center)
      
    }
}

#Preview {
    
    CircularProgressView(circleWidth: 150, circleHeight: 150, progress: .constant(0.4))
}
