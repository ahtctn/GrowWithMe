//
//  TimerForwardBackwardTextView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 25.03.2024.
//

import SwiftUI

struct TimerForwardBackwardTextView: View {
    
    @Binding var isBackwardORForwardTapped: Bool
    var textSecond: String
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 45, height: 45, alignment: .center)
                .foregroundStyle(.orange.opacity(0.4))
            
            
            Text(textSecond)
                .font(.title3)
                .foregroundStyle(.orange)
                .bold()
        }
        .opacity(isBackwardORForwardTapped ? 1 : 0)
        
    }
}

#Preview {
    TimerForwardBackwardTextView(isBackwardORForwardTapped: .constant(true), textSecond: "10")
}
