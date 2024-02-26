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
    @State private var isAddDataButtonTapped: Bool = false
    
    var sortedData: [PhysicalDataModel] {
        return viewModel.data.sorted(by: { $0.weight > $1.weight })
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("Weight") {
                    Chart {
                        ForEach(sortedData.prefix(12)) { data in
                            LineMark(x: PlottableValue.value("Date", data.date), y: .value("Weight","\( data.weight) kg"))
                                .symbol(by: .value("Weight", "Weight/ Date"))
                                .lineStyle(StrokeStyle(lineWidth: 4, dash: [10, 10]))
                        }
                    }
                    
                    .padding()
                    .frame(height: 300)
                    
                }
                
                Section("Length") {
                    Chart {
                        ForEach(sortedData.prefix(12)) { data in
                            LineMark(x: PlottableValue.value("Date", data.date),
                                     y: .value("Length", "\(data.length)m"))
                            .symbol(by: .value("Length", "Length/ Date"))
                            .lineStyle(StrokeStyle(lineWidth: 4, dash: [10, 10]))
                            
                        }
                    }
                    .padding()
                    .frame(height: 300)
                    
                }
                
                Section("BMI") {
                    Chart {
                        ForEach(sortedData.prefix(12)) { data in
                            let bmi = viewModel.calculateBMI(weight: data.weight, height: data.length)
                            
                            LineMark(x: PlottableValue.value("Date", data.date), y: .value("BMI", String(format: "%.2f", bmi)))
                                .symbol(by: .value("BMI", "BMI/ Date"))
                                .lineStyle(StrokeStyle(lineWidth: 4, dash: [10, 10]))
                            
                            
                        }
                    }
                    .padding()
                    .frame(height: 300)
                }
                
                .sheet(isPresented: $isAddDataButtonTapped){
                    AddDataView(dismiss: {isAddDataButtonTapped = false})
                        .presentationDetents([.fraction(0.4)])
                }
                
                
                
            }
            .navigationTitle("stats".localized())
            .navigationBarItems(
                trailing:
                    Button {
                        isAddDataButtonTapped.toggle()
                    } label: {
                        Text("Add Data")
                    }
            )
        }
        
    }
}

#Preview {
    StatsView()
}

struct AddDataView: View {
    var dismiss: () -> Void
    var body: some View {
        Text("Add Data button tapped")
    }
}
