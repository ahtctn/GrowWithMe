//
//  TabBarView.swift
//  GrowWithMe
//
//  Created by Ahmet Ali ÇETİN on 30.01.2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("home".localized(), systemImage: "house.fill")
                }
            StatsView()
                .tabItem {
                    Label("stats".localized(), systemImage: "chart.pie.fill")
                }
            StoryView()
                .tabItem {
                    Label("story".localized(), systemImage: "book.fill")
                }
            SettingsView()
                .tabItem {
                    Label("settings".localized(), systemImage: "gear")
                }
        }
    }
}

#Preview {
    TabBarView()
}
