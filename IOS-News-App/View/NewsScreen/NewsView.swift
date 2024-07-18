//
//  NewsView.swift
//  IOS-News-App
//
//  Created by Bholanath Barik on 16/07/24.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        VStack{
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
