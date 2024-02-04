//
//  CheckboxView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 4.02.2024.
//

import SwiftUI

struct CheckboxView: View {
    @Binding var isChecked: Bool

        var body: some View {
            Button {
                isChecked.toggle()
            } label: {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            }
        }
}

#Preview {
    CheckboxView(isChecked: .constant(true))
}
