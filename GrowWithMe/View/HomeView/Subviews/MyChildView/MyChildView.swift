//
//  MyChildView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 30.01.2024.
//

import SwiftUI

struct MyChildView: View {
    var body: some View {
        Section("My Child") {
            HStack(spacing: 10) {
                
                Image("baby")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150, alignment: .center)
                    .cornerRadius(75)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Prenses Ela")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("12 months")
                        .foregroundStyle(.secondary)
                    HStack {
                        Text("6.2 kg")
                        Text("73 cm")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Click to see the details")
                            .underline()
                            .font(.footnote)
                    }
                }
            }
        }
    }
}

#Preview {
    MyChildView()
}
