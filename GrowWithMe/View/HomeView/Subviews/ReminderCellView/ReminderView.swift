//
//  ReminderView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import SwiftUI

struct ReminderView: View {
    @EnvironmentObject var reminderDataVM: ReminderDataViewModel
    @EnvironmentObject var myChildDataVM: MyChildViewModel
    @State private var isChecked: Bool = false
    @State private var isPaywallPresented: Bool = false
    @Binding var isShowingPopup: Bool 
    
    var body: some View {
        Section(header: HStack {
            Text("reminders".localized())
            Spacer()
            Button {
                
                if checkChildrenForPaywall() {
                    isPaywallPresented = true
                } else {
                    reminderDataVM.presentAddReminder()
                    //isPaywallPresented = true
                }
                
            } label: {
                Image(systemName: "plus.circle.fill")
            }
        }
        ) {
            if !reminderDataVM.reminderData.isEmpty {
                ForEach($reminderDataVM.reminderData, id: \.id) { $data in
                    
                    RemindersCellView(title: data.title,
                                      subtitle: data.subtitle,
                                      date: DateFormatter.customDateFormatter.string(from: data.date),
                                      note: data.note,
                                      isChecked: $data.isChecked)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        deleteButton($data.wrappedValue)
                    }
                }
                
            } else {
                noCellView()
            }
            
        }
        .sheet(isPresented: $reminderDataVM.isAddReminderPresented) {
            AddReminderView(dismiss: {
                reminderDataVM.isAddReminderPresented = false
                isShowingPopup = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    isShowingPopup = false
                }
            })
                .presentationDetents([.fraction(0.4)])
        }

        .fullScreenCover(isPresented: $isPaywallPresented){
            PaywallView(isPaywallPresented: $isPaywallPresented)
        }
    }
    
    
    @ViewBuilder
    func deleteButton(_ reminder: ReminderDataModel) -> some View {
        Button {
            Task.init {
                await reminderDataVM.deleteReminder(reminder)
            }
        } label: {
            Label("delete".localized(), systemImage: "trash")
        }
        .tint(.red)
    }
    @ViewBuilder
    func noCellView() -> some View {
        HStack {
            Image("noReminder")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100, alignment: .center)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("no_reminders".localized())
                    .font(.title3).bold()
                Text("no_reminders_subtitle".localized())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(height: 80)
    }
    
    private func checkChildrenForPaywall() -> Bool {
        for data in myChildDataVM.myChildData {
            print("Data premium mu değil mi? \(data.isPremium)")
            if !data.isPremium && reminderDataVM.reminderData.count >= 2 {
                return true
            }
        }
        return false
    }
}

#Preview {
    ReminderView(isShowingPopup: .constant(true))
}
