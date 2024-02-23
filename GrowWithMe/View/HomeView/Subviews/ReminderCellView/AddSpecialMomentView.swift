//
//  AddSpecialMomentView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 7.02.2024.
//

import SwiftUI
import UIKit

struct AddSpecialMomentView: View {
    @EnvironmentObject var specialMomentDataVM: SpecialMomentsDataViewModel
    @State private var title: String = ""
    @State private var subtitle: String = ""
    @State private var date = Date()
    @State private var selectedImage: UIImage?
    @State private var showImagePicker: Bool = false
    @State private var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary
    var dismiss: () -> Void
    
    var body: some View {
        NavigationView {
            Form {
                if selectedImage == nil {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(16)
                                .frame(width: 100, height: 100)
                                .foregroundStyle(.secondary)
                            Spacer()
                        }
                        Button {
                            self.showImagePicker = true
                        } label: {
                            Text("select_image".localized())
                                .fontWeight(.bold)
                        }
                    }
                }
                if let image = selectedImage {
                    VStack {
                        HStack {
                            Spacer()
                            Button {
                                selectedImage = nil
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                            }
                            
                        }
                        HStack {
                            Spacer()
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(16)
                                .frame(width: 150, height: 150)
                            Spacer()
                        }
                    }
                }
                TextField("title".localized(), text: $title)
                TextField("description".localized(), text: $subtitle)
                DatePicker(
                    "start_date".localized(),
                    selection: $date,
                    displayedComponents: [.date]
                )
                
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            let specialMomentsData = SpecialMomentsDataModel(title: title, image: selectedImage, subtitle: subtitle, date: date)
                            specialMomentDataVM.addSpecialMomentsData(specialMomentsData)
                        }
                        dismiss()
                    } label: {
                        Text("done".localized())
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            .navigationTitle("add_special_moment".localized())
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$selectedImage, sourceType: self.imagePickerSourceType)
            }
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        // Handle the selected image here, you may want to save it to your model
        // For now, I'll just print its size
        print("Selected image size: \(selectedImage.size)")
    }
}

#Preview {
    AddSpecialMomentView(dismiss: {})
}
