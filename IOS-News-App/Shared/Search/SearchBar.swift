//
//  SearchBar.swift
//  IOS-News-App
//
//  Created by Bholanath Barik on 19/07/24.
//

import SwiftUI

struct SearchBar: View {
    @EnvironmentObject var NewsModel : SearchViewModel;
    
    var body: some View {
        VStack {
                   ZStack(alignment: .trailing) {
                       TextField("Search...", text: $NewsModel.searchText)
                           .padding()
                           .frame(height: 50)
                           .background(Color(.systemGray6))
                           .cornerRadius(15)
                       
                       if !NewsModel.searchText.isEmpty {
                           Button(action: {
                               NewsModel.clearSearch()
                           }) {
                               Image(systemName: "xmark.circle")
                                   .foregroundColor(.gray)
                                   .padding(.trailing, 8)
                           }
                           .padding(.trailing, 8)
                       }
                   }
                   .padding(.horizontal)
               }
    }
}

#Preview {
    SearchBar()
}
