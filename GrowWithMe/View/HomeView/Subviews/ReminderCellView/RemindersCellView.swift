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
                    .font(Row.title.textStyle)
                    .bold()
                HStack(spacing: 8) {
                    Image(systemName: Row.subtitle.imageName!)
                        .foregroundStyle(.orange)
                    Text(subtitle)
                }
                
                HStack(spacing: 8) {
                    Image(systemName: Row.date.imageName!)
                        .foregroundStyle(.orange)
                    Text(date)
                        .font(Row.date.textStyle)
                }
                HStack(spacing: 8) {
                    Image(systemName: Row.note.imageName!)
                        .foregroundStyle(.orange)
                    Text(note)
                        .font(Row.note.textStyle)
                }
                
            }
            Spacer()
            CheckboxView(isChecked: $isChecked)
        }
    }
}

#Preview {
    RemindersCellView(title: "Title", subtitle: "Subtitle", date: "01.02.2025", note: "Note Note", isChecked: .constant(true))
}

extension RemindersCellView {
    enum Row: Hashable {
        case title
        case subtitle
        case date
        case note
        
        var imageName: String? {
            switch self {
            case .subtitle:
                return "pencil.circle"
            case .date:
                return "calendar.badge.plus"
            case .note:
                return "note.text"
            default: return nil
            }
        }
        
        var textStyle: Font {
            switch self {
            case .title:
                return .title3
            case .date:
                return .subheadline
            case .note:
                return .footnote
            default: return .subheadline
            }
        }
    }
}
