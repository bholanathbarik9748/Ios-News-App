//
//  News Card.swift
//  IOS-News-App
//
//  Created by Bholanath Barik on 16/07/24.
//

import SwiftUI

struct NewsCard: View {
    private let helper = Helper()
    
    let imgUrl = "https://media.wired.com/photos/6672c421e0704c563b4e7b77/191:100/w_1280,c_limit/GettyImages-80973767.jpg"
    
    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: URL(string: imgUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(height: 150)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("This Ancient Technology Is Helping Millions Stay Cool")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                HStack {
                    if let formatedTime = helper.convertTimestampToReadableDateAndTime("2024-07-09T15:42:42Z") {
                        Text(formatedTime)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Save button action here
                        print("Article saved!")
                    }) {
                        HStack {
                            Image(systemName: "bookmark.fill")
                            Text("Save")
                                .font(.caption)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.blue.opacity(0.1))
                        .foregroundColor(.blue)
                        .cornerRadius(8)
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
        }
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

#Preview {
    NewsCard()
}
