//
//  Home.swift
//  IOS-News-App
//
//  Created by Bholanath Barik on 15/07/24.
//

import SwiftUI

struct Home: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
    }
    
    var body: some View {
        TabView {
            NewsView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            BookMarkView()
                .tabItem {
                    Label("Bookmarks", systemImage: "bookmark.fill")
                }
        }
        .accentColor(Color.primary)
    }
}

#Preview {
    Home()
}
