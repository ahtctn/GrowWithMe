//
//  MyChildView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 30.01.2024.
//

import SwiftUI

struct MyChildView: View {
    @ObservedObject var viewModel: PhysicalDataViewModel = PhysicalDataViewModel()
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
                        .font(Row.name.textStyle)
                    HStack(spacing: 8) {
                        Row.age.imageName
                            .foregroundStyle(Row.age.fontColor)
                        Text("12 months")
                            .foregroundStyle(.secondary)
                    }
                    
                    HStack {
                        Row.length.imageName
                            .foregroundStyle(Row.length.fontColor)
                        Text("6kg")
                            .padding(2)
                        Row.weight.imageName
                            .foregroundStyle(Row.weight.fontColor)
                        Text("73 cm")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Click to see the details")
                            .underline()
                            .font(Row.detail.textStyle)
                    }
                }
            }
        }
    }
}

#Preview {
    MyChildView()
}

extension MyChildView {
    enum Row: Hashable {
        case name
        case age
        case weight
        case length
        case detail
        
        var imageName: Image? {
            switch self {
            case .age:
                return Image(systemName: "gift.fill")
            case .weight:
                return Image(systemName: "scalemass.fill")
            case .length:
                return Image(systemName: "ruler")
            default: return nil
            }
        }
        
        var textStyle: Font {
            switch self {
            case .name:
                return .title2.bold()
            case .detail:
                return .footnote
            default: return .subheadline
            }
        }
        
        var fontColor: Color {
            return .orange
        }
    }
}
