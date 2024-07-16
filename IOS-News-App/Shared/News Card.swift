//
//  News Card.swift
//  IOS-News-App
//
//  Created by Bholanath Barik on 16/07/24.
//

import SwiftUI

struct News_Card: View {
    private let helper = Helper()
    
    let imgUrl = "https://media.wired.com/photos/6672c421e0704c563b4e7b77/191:100/w_1280,c_limit/GettyImages-80973767.jpg"
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: imgUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("This Ancient Technology Is Helping Millions Stay Cool")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("Cheap, low-energy evaporative cooling devices are keeping water, food......")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                if let formatedTime = helper.convertTimestampToReadableDateAndTime("2024-07-09T15:42:42Z") {
                    Text(formatedTime)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        
    }
}

#Preview {
    News_Card()
}
