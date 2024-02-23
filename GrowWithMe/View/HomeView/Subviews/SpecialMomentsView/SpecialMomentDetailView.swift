//
//  SpecialMomentDetailView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 7.02.2024.
//

import SwiftUI

struct SpecialMomentDetailView: View {
    var title: String
    var subtitle: String
    var date: Date
    var image: Image
    
    var body: some View {
        VStack(alignment: .leading) {
            image
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.orange, lineWidth: 3)
                )
                .padding(.bottom, 20)
            HStack(spacing: 8) {
                Image(systemName: "doc.append.fill")
                    .foregroundStyle(.orange)
                Text(title)
                    .font(.title).bold()
                    .padding(.bottom, 5)
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Image(systemName: "book")
                    .foregroundStyle(.orange)
                Text(subtitle)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
            }
            
            HStack(alignment: .center, spacing: 8) {
                Image(systemName: "calendar")
                Text(date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .navigationTitle("special_moment".localized())
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    SpecialMomentDetailView(title: "Title title", subtitle: "Subtitle subtitle", date: Date.now, image: Image("baby"))
}
