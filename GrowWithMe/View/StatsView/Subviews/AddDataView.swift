//
//  AddDataView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 26.02.2024.
//

import SwiftUI

struct AddDataView: View {
    var dismiss: () -> Void
    @State private var weight: String = ""
    @State private var length: String = ""
    @State private var isShowingPopup: Bool = false
    @State private var selectedDate: Date = Date()
    
    var isDataEntered: Bool {
        return (!weight.isEmpty || !length.isEmpty)
    }
    
    var isBothDataEntered: Bool {
        return (!weight.isEmpty && !length.isEmpty)
    }
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section {
                        HStack {
                            Text("m")
                            TextField("weight".localized(), text: $weight)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .multilineTextAlignment(.trailing)
                                
                        }
                            .keyboardType(.numberPad)
                        
                        HStack {
                            Text("kg")
                            TextField("length".localized(), text: $length)
                                .keyboardType(.numberPad)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack {
                            Text("date".localized())
                            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                                
                        }
                        
                    }
                }
                
                .navigationTitle("add_weight_height")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(isDataEntered ? .orange : .secondary)
                }
                                    ,
                                    trailing:
                                        Button {
                    if isBothDataEntered {
                        dismiss()
                    } else {
                        isShowingPopup = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            isShowingPopup = false
                        }
                    }
                    
                } label: {
                    Text("done".localized()).bold()
                }
                                    
                )
            }
            
            if isShowingPopup {
                withAnimation(.easeIn(duration: 1.0)) {
                    VStack {
                        Spacer()
                        PopupView(isShowingPopup: $isShowingPopup, title: "Invalid Data Addition", subtitle: "Please enter both weight and length data.")
                            .padding(.bottom, 40)
                    }
                }
                
            }
        }
    }
}


#Preview {
    AddDataView(dismiss: {})
}
