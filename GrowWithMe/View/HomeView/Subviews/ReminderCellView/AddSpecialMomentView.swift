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
                            Text("Select Image")
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
                TextField("Title", text: $title)
                TextField("Subtitle", text: $subtitle)
                DatePicker(
                    "Start Date",
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
                        Text("Done")
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
            .navigationTitle("Add special moment")
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

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
