//
//  SpecialMomentsView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import SwiftUI

struct SpecialMomentsView: View {
    @EnvironmentObject var specialMomentsDataVM: SpecialMomentsDataViewModel
    
    var body: some View {
        Section(
            header:
                HStack {
                    Text("Special Moments")
                    Spacer()
                    Button {
                        print("add special moments button tapped")
                        specialMomentsDataVM.presentAddSpecialMomentsView()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
        ) {
            if !specialMomentsDataVM.specialMomentsData.isEmpty {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible())], spacing: 8) {
                        ForEach(specialMomentsDataVM.specialMomentsData) { data in
                            NavigationLink(destination: SpecialMomentDetailView(title: data.title, subtitle: data.subtitle, date: data.date, image: data.image ?? Image("photo.fill"))) {
                                
                                SpecialMomentsCellView(title: data.title, subtitle: data.subtitle, image: data.image ?? Image(systemName: "photo.fill"), date: data.date)
                                
                                    .contextMenu { // Uzun basılı tutma menüsü
                                        Button {
                                            Task.init {
                                                await specialMomentsDataVM.deleteSpecialMoments(data)
                                            }
                                            
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding()
                
            }
            else {
                noCellView()
            }
        }
        .sheet(isPresented: $specialMomentsDataVM.isAddSpecialMomentsPresented) {
            AddSpecialMomentView(dismiss: {specialMomentsDataVM.isAddSpecialMomentsPresented = false})
                .presentationDetents([.fraction(0.6)])
        }
    }
    
    @ViewBuilder
    func noCellView() -> some View {
        HStack {
            Image("noMemory")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100, alignment: .center)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("No Special Moments")
                    .font(.title3).bold()
                Text("You can record your child's unique moments here.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(height: 80)
    }
}

#Preview {
    SpecialMomentsView()
}
