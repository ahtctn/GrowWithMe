//
//  SpecialMomentsCellView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import SwiftUI

struct SpecialMomentsCellView: View {
    @ObservedObject var specialMomentsDataVM = SpecialMomentsDataViewModel()
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 8) {
                ForEach(specialMomentsDataVM.data) { data in
                    data.image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.orange).opacity(0.5)
                        .cornerRadius(15)
                    
                        .overlay {
                            VStack {
                                Text(data.title)
                                    .bold()
                                    .font(.title2)
                                    .foregroundStyle(.orange)
                                
                            }
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SpecialMomentsCellView()
}
