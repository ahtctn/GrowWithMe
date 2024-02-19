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
    
    @State private var isChecked: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                MyChildView()
                    .environmentObject(MyChildViewModel())
                ReminderView()
                    .environmentObject(ReminderDataViewModel())
                    .environmentObject(MyChildViewModel())
                SpecialMomentsView()
                    .environmentObject(SpecialMomentsDataViewModel())
                
            }
            
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}


