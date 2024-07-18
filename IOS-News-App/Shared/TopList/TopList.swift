//
//  TopList.swift
//  IOS-News-App
//
//  Created by Bholanath Barik on 17/07/24.
//

import SwiftUI

struct TopList: View {
    let newsTopic = [
        "India",
        "World",
        "Business",
        "Technology",
        "Entertainment",
        "Sports",
        "Science",
        "Health"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(newsTopic, id: \.self) { topic in
                    Button(action: {
                        print(topic);
                    }){
                        Text(topic)
                            .padding(.horizontal,20)
                            .padding(.vertical,10)
                            .background(Color("Primary"))
                            .foregroundColor(Color("Secondary"))
                            .cornerRadius(10)
                            .font(.footnote)
                            .bold()
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    TopList()
}
