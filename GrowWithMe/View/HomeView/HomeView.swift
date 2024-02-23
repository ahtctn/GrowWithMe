//
//  HomeView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 30.01.2024.
//

import SwiftUI
import Charts

struct HomeView: View {
    @ObservedObject var physicalDataVM = PhysicalDataViewModel()
    @ObservedObject var specialMomentsDataVM = SpecialMomentsDataViewModel()
    @State private var isShowingPopup: Bool = false
    
    @State private var isChecked: Bool = false
    
    var body: some View {
        ZStack {
                        
            NavigationStack {
                
                List {
                    MyChildView()
                        .environmentObject(MyChildViewModel())
                    ReminderView(isShowingPopup: $isShowingPopup)
                        .environmentObject(ReminderDataViewModel())
                        .environmentObject(MyChildViewModel())
                    SpecialMomentsView()
                        .environmentObject(SpecialMomentsDataViewModel())
                    
                }
                
                .navigationTitle("home".localized())
            }
            
            if isShowingPopup {
                withAnimation(.easeIn(duration: 1.0)) {
                    VStack {
                        Spacer()
                        PopupView(isShowingPopup: $isShowingPopup, title: "reminder_added".localized(), subtitle: "reminder_added_description".localized())
                    }
                }
            }
            
        }
    }
}

#Preview {
    HomeView()
}


