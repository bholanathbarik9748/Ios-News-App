//
//  NewsView.swift
//  IOS-News-App
//
//  Created by Bholanath Barik on 16/07/24.
//

import SwiftUI

struct NewsView: View {
    @StateObject private var searchViewModel = SearchViewModel()
    
    var body: some View {
        VStack{
            SearchBar()
                .environmentObject(searchViewModel)
            
            TopList()
            
            ScrollView(.vertical, showsIndicators: false){
                NewsCard()
                NewsCard()
                NewsCard()
                NewsCard()
                NewsCard()
            }
        }
    }
}

#Preview {
    NewsView()
}
