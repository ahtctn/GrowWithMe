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
                    Label("Home", systemImage: "house.fill")
                }
            StatsView()
                .tabItem {
                    Label("Stats", systemImage: "chart.pie.fill")
                }
            StoryView()
                .tabItem {
                    Label("Story", systemImage: "book.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    TabBarView()
}
