//
//  CustomStyledTabView.swift
//  CustomTabBar
//
//  Created by Javier Calatrava on 4/4/26.
//
import SwiftUI
import Foundation
import UIKit

struct CustomStyledTabView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        
        // Correct way to style the text/label
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemPurple,
            .font: UIFont.boldSystemFont(ofSize: 12)
        ]
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray
        ]
        
        // Apply attributes to the stacked layout (standard bottom bar)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
        appearance.stackedLayoutAppearance.selected.iconColor = .systemPurple
        
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
        appearance.stackedLayoutAppearance.normal.iconColor = .gray

        // Apply the appearance to the global singleton
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView {
            
            // Tab 1: Main Scrollable Content
            MainScrollStoryView()
                .tabItem {
                    Label("Home", systemImage: "doc.text.fill")
                }
            
            // Tab 2: Profile/User View
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
            
            // Tab 3: Settings View
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
} 
