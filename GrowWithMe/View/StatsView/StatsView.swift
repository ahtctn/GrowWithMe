//
//  StatsView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 30.01.2024.
//

import SwiftUI
import Charts

struct StatsView: View {
    @EnvironmentObject var physicalDataVM: PhysicalDataViewModel
    @State private var isAddDataButtonTapped: Bool = false
    @State private var isSheetPresented: Bool = false
    
    
    var sortedData: [PhysicalDataModel] {
        return physicalDataVM.data.sorted(by: { $0.weight > $1.weight })
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section("weight".localized()) {
                    Chart {
                        ForEach(sortedData.prefix(12)) { data in
                            LineMark(x: PlottableValue.value("date".localized(), data.date), y: .value("weight".localized(),"\( data.weight) kg"))
                                .symbol(by: .value("weight".localized(), "weight_date".localized()))
                                .lineStyle(StrokeStyle(lineWidth: 4, dash: [10, 10]))
                        }
                    }
                    .padding()
                    .frame(height: 300)
                }
                
                Section("length".localized()) {
                    Chart {
                        ForEach(sortedData.prefix(12)) { data in
                            LineMark(x: PlottableValue.value("date".localized(), data.date),
                                     y: .value("length".localized(), "\(data.length)m"))
                            .symbol(by: .value("length".localized(), "length_date".localized()))
                            .lineStyle(StrokeStyle(lineWidth: 4, dash: [10, 10]))
                            
                        }
                    }
                    .padding()
                    .frame(height: 300)
                    
                }
                
                Section("bmi".localized()) {
                    Chart {
                        ForEach(sortedData.prefix(12)) { data in
                            let bmi = physicalDataVM.calculateBMI(weight: data.weight, height: data.length)
                            
                            LineMark(x: PlottableValue.value("date".localized(), data.date), y: .value("bmi".localized(), String(format: "%.2f", bmi)))
                                .symbol(by: .value("bmi".localized(), "bmi_date".localized()))
                                .lineStyle(StrokeStyle(lineWidth: 4, dash: [10, 10]))
                            
                            
                        }
                    }
                    .padding()
                    .frame(height: 300)
                }
                
                .sheet(isPresented: $isSheetPresented){
                    AddDataView(dismiss: {
                        isSheetPresented = false
                    })
                        .presentationDetents([.fraction(0.4)])
                }
            }
            .navigationTitle("stats".localized())
            .navigationBarItems(
                
                trailing:
                    Button {
                        //physicalDataVM.presentAddData()
                        isSheetPresented = true
                        
                        print("\(isSheetPresented) Is Sheet Presented?")
                    } label: {
                        Text("add_data".localized())
                    }
            )
        }
        
    }
}

#Preview {
    StatsView()
}


struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("This is a sheet")
            Button("Close") {
                // Close the sheet
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
    }
}
