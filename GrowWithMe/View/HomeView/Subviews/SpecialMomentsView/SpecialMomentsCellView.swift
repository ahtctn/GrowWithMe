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
                    VStack(spacing: 8) {
                        data.image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .cornerRadius(15)
                        HStack(spacing: 8) {
                            Image(systemName: "heart.text.square.fill")
                                .foregroundStyle(Row.symbol.color)
                            Text(data.title)
                                .font(Row.title.textStyle)
                        }
                        HStack(spacing: 8) {
                            Text(data.subtitle.prefix(20))
                                .font(.footnote)
                                .lineLimit(3)
                            
                        }
                        
                        
                    }
                    
                    .frame(maxWidth: 150)
                    //.frame(maxHeight: calculateCellHeight())
                    
                }
            }
            .padding()
        }
        
    }
    
    private func calculateCellHeight() -> CGFloat {
        // Burada, subtitle'ın içeriğine bağlı olarak hücre yüksekliğini dinamik olarak hesaplayabilirsiniz.
        // İstediğiniz koşullara göre bu hesaplamayı ayarlayabilirsiniz.
        // Örneğin, metnin uzunluğuna bağlı olarak farklı bir hesaplama yapabilirsiniz.
        // Şu anda sabit bir değer döndürüyorum, bu değeri ihtiyacınıza göre ayarlayabilirsiniz.
        return 350
    }

}

#Preview {
    SpecialMomentsCellView()
}

extension SpecialMomentsCellView {
    enum Row: Hashable {
        case title
        case symbol
        
        var textStyle: Font? {
            switch self {
            case .title:
                return .title2.bold()
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
