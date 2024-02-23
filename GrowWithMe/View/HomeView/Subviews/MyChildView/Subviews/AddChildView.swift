//
//  AddChildView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 19.02.2024.
//

import SwiftUI

struct AddChildView: View {
    @EnvironmentObject var myChildDataVM: MyChildViewModel
    
    @State private var name: String = ""
    @State private var birthDate: Date = .now
    @State private var weight: String = ""
    @State private var height: String = ""
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
                TextField("name".localized(), text: $name)
                TextField("weight".localized(), text: $weight)
                    .keyboardType(.numberPad)
                TextField("height".localized(), text: $height)
                    .keyboardType(.numberPad)
                DatePicker("birth_date".localized(), selection: $birthDate, displayedComponents: [.date])
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        let addChildData = MyChildDataModel(name: name, height: height, weight: weight, birthDate: birthDate, image: selectedImage, isPremium: false)
                        myChildDataVM.addChildData(addChildData)
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
        }
        .navigationTitle("Add child")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage ) {
            ImagePicker(image: self.$selectedImage, sourceType: self.imagePickerSourceType)
        }
    }
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        print("Selected image size: \(selectedImage.size)")
    }
}

#Preview {
    AddChildView(dismiss: {})
}
