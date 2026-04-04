//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Javier Calatrava on 4/4/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // The main container for the tabs
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
        // Optional: Change the accent color of the active tab
        .accentColor(.blue)
    }
}

// MARK: - Main Scrollable View
struct MainScrollStoryView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    Text("The Future of SwiftUI")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                    
                    // Generating a large block of text to enable scrolling
                    ForEach(1...25, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Chapter \(index)")
                                .font(.headline)
                                .foregroundColor(.secondary)
                            
                            Text("This is a demonstration of a ScrollView inside a TabView. In SwiftUI, the TabBar remains anchored at the bottom while the content flows behind it. This specific block of text is part of iteration number \(index), ensuring that we have enough height to trigger the scrolling physics of the device.")
                                .font(.body)
                                .lineSpacing(6)
                        }
                        Divider()
                    }
                }
                .padding()
            }
            .navigationTitle("Main Feed")
        }
    }
}

// MARK: - Secondary Views
struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .font(.system(size: 80))
                .foregroundColor(.blue)
            Text("User Profile")
                .font(.title)
                .padding()
        }
    }
}

struct SettingsView: View {
    var body: some View {
        List {
            Section(header: Text("App Settings")) {
                Toggle("Notifications", isOn: .constant(true))
                Toggle("Dark Mode", isOn: .constant(false))
            }
        }
        .navigationTitle("Settings")
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
