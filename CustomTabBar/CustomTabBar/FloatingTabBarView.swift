//
//  FloatingTabBarView.swift
//  CustomTabBar
//
//  Created by Javier Calatrava on 4/4/26.
//
import SwiftUI

import SwiftUI

struct FloatingTabBarView: View {
    @State private var selectedTab = 0
    @State private var isTabBarVisible = true // Controls the visibility
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // 1. Main Content Area
            NavigationStack {
                MainScrollStoryView()
                .navigationTitle("Auto-hide Bar")
                .onScrollGeometryChange(for: CGFloat.self) { geo in
                    geo.contentOffset.y
                } action: { oldValue, newValue in
                    let scrollingDown = newValue > oldValue
                    let isAtTop = newValue <= 0
                    
                    withAnimation(.easeInOut(duration: 0.3)) {
                        if isAtTop {
                            isTabBarVisible = true
                        } else if scrollingDown {
                            isTabBarVisible = false
                        } else {
                            // Logic for showing it when scrolling up or stopping
                            isTabBarVisible = true
                        }
                    }
                }
            }

            // 3. The Custom Tab Bar
            if isTabBarVisible {
                CustomBar(selectedTab: $selectedTab)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .zIndex(1) // Ensure it stays on top during transitions
            }
        }
    }
}

// Separate component for clarity
struct CustomBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 40) {
            TabBarButton(index: 0, icon: "house.fill", selectedTab: $selectedTab)
            TabBarButton(index: 1, icon: "magnifyingglass", selectedTab: $selectedTab)
            TabBarButton(index: 2, icon: "person.fill", selectedTab: $selectedTab)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        .background(.ultraThinMaterial) // Gives a nice blur effect
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.15), radius: 10, y: 5)
        .padding(.bottom, 20)
    }
}

struct TabBarButton: View {
    let index: Int
    let icon: String
    @Binding var selectedTab: Int
    
    var body: some View {
        Button(action: { selectedTab = index }) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(selectedTab == index ? .blue : .gray)
        }
    }
}

#Preview {
    FloatingTabBarView()
}

/*
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
*/
