//
//  MyChildView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 30.01.2024.
//

import SwiftUI
//MARK: Section'daki add butonundan dolayı preview crash veriyor.
struct MyChildView: View {
    @EnvironmentObject var myChildDataVM: MyChildViewModel
    var body: some View {
        Section(header: HStack {
            Text("my_child".localized())
            Spacer()
            Button {
                myChildDataVM.presentAddChild()
                
            } label: {
                Image(systemName: "plus.circle.fill")
            }
        }) {
            if myChildDataVM.myChildData.isEmpty {
                HStack(spacing: 10) {
                    LootieAnimationView(name: "baby", loopMode: .loop)
                        .frame(width: 100, height: 100, alignment: .center)
                    Text("empty_child_cell_text".localized())
                        .bold()
                }
            } else {
                if let childData = myChildDataVM.myChildData.first {
                    HStack(spacing: 10) {
                        
                        Image(uiImage: UIImage(data: childData.imageData!)!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150, alignment: .center)
                            .cornerRadius(75)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text(childData.name)
                                .font(Row.name.textStyle)
                            HStack(spacing: 8) {
                                Row.age.imageName
                                    .foregroundStyle(Row.age.fontColor)
                                Text(childData.birthDate.description)
                                    .foregroundStyle(.secondary)
                            }
                            
                            HStack {
                                Row.length.imageName
                                    .foregroundStyle(Row.length.fontColor)
                                Text("\(childData.weight) kg")
                                    .padding(2)
                                Row.weight.imageName
                                    .foregroundStyle(Row.weight.fontColor)
                                Text("\(childData.height) cm")
                            }
                            
                            Button {
                                
                            } label: {
                                Text("click_to_see_the_details".localized())
                                    .underline()
                                    .font(Row.detail.textStyle)
                            }
                        }
                    }
                }
            }
            
            
            
            
        }
        .sheet(isPresented: $myChildDataVM.isAddChildViewPresented) {
            AddChildView(dismiss: {myChildDataVM.isAddChildViewPresented = false})
                .presentationDetents([.fraction(0.6)])
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


