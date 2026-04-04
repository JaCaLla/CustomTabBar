//
//  FloatingTabBarView.swift
//  CustomTabBar
//
//  Created by Javier Calatrava on 4/4/26.
//
import SwiftUI

struct FloatingTabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Main Content Area
            Group {
                if selectedTab == 0 {
                    MainScrollStoryView()
                } else if selectedTab == 1 {
                    ProfileView()
                } else {
                    SettingsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Custom Floating Tab Bar
            HStack(spacing: 40) {
                TabBarButton(index: 0, icon: "house.fill", selectedTab: $selectedTab)
                TabBarButton(index: 1, icon: "magnifyingglass", selectedTab: $selectedTab)
                TabBarButton(index: 2, icon: "person.fill", selectedTab: $selectedTab)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background(Color.black.opacity(0.8))
            .clipShape(Capsule())
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
            .padding(.horizontal)
            .padding(.bottom, 10) // Space from bottom edge
        }
    }
}

struct TabBarButton: View {
    let index: Int
    let icon: String
    @Binding var selectedTab: Int
    
    var body: some View {
        Button(action: { selectedTab = index }) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(selectedTab == index ? .white : .gray)
        }
    }
}
