//
//  RemindersCellView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import SwiftUI

struct RemindersCellView: View {
    var title: String
    var subtitle: String
    var date: String
    var note: String
    @Binding var isChecked: Bool
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                    .bold()
                
                Text(subtitle)
                Text(date)
                    .font(.subheadline)
                Text(note)
                    .font(.footnote)
            }
            Spacer()
            CheckboxView(isChecked: $isChecked)
        }
    }
}

#Preview {
    RemindersCellView(title: "Title", subtitle: "Subtitle", date: "01.02.2025", note: "Note Note", isChecked: .constant(true))
}
