//
//  StatsView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 30.01.2024.
//

import SwiftUI
import Charts

struct StatsView: View {
    @ObservedObject var viewModel = PhysicalDataViewModel()
    var body: some View {
        NavigationStack {
            List {
                Section("Weight") {
                    Chart {
                        ForEach(viewModel.data) { data in
                            BarMark(x: PlottableValue.value("Height", "\(data.weight) kg"), y: .value("Weight", data.date))
                        }
                    }
                    .padding()
                    
                }
                
                Section("Length") {
                    Chart {
                        ForEach(viewModel.data) { data in
                            BarMark(x: PlottableValue.value("Length", "\(data.length) m"), y: .value("Date", data.date))
                        }
                    }
                    .padding()
                    
                }
            }
            .navigationTitle("Stats")
        }
        
    }
}

#Preview {
    StatsView()
}
