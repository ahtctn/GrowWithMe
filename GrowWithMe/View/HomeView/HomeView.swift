//
//  HomeView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 30.01.2024.
//

import SwiftUI
import Charts

struct HomeView: View {
    var viewModel = PhysicalDataViewModel()
    var body: some View {
        NavigationStack {
            List {
                MyChildView()
                
                Section("Height- Weight") {
                    Chart {
                        ForEach(PhysicalDataViewModel.data) { data in
                            BarMark(x: PlottableValue.value("Height", data.height), y: .value("Weight", data.weight))
                                
                        }
                    }
                    .padding()
                    
                }
                
                Section("Reminder") {
                    Text("Reminder")
                    Text("Reminder")
                    Text("Reminder")
                    Text("Reminder")
                }
                
            }
            
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
