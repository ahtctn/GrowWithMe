//
//  SpecialMomentsCellView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import SwiftUI

struct SpecialMomentsCellView: View {
    var title: String
    var subtitle: String
    var image: Image
    var date: Date
    
    var body: some View {
        VStack(spacing: 8) {
            image
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .cornerRadius(15)
            HStack(spacing: 8) {
                Image(systemName: "heart.text.square.fill")
                    .foregroundStyle(Row.symbol.color)
                Text(title)
                    .font(Row.title.textStyle)
            }
            HStack(spacing: 8) {
                Text(subtitle.prefix(25))
                    .font(.footnote)
                    .lineLimit(3)
                
            }
            let dateString = DateFormatter.customDateFormatter.string(from: date)
            Text(dateString)
                .font(Row.date.textStyle)
            
        }
        
        .frame(maxWidth: 150)
        
        
    }
    
    
}

#Preview {
    SpecialMomentsCellView(title: "Title", subtitle: "subtitle subtile subtitle", image: Image(systemName: "photo.fill"), date: Date.now)
}

extension SpecialMomentsCellView {
    enum Row: Hashable {
        case title
        case symbol
        case date
        
        var textStyle: Font? {
            switch self {
            case .title:
                return .subheadline.bold()
            case .date:
                return .footnote
            default: return nil
            }
        }
        
        var symbolName: Image {
            switch self {
            case .symbol:
                return Image(systemName: "heart.text.square.fill")
            default: return Image(systemName: "xmark")
            }
        }
        
        var color: Color {
            return .orange
        }
    }
}
