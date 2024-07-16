//
//  ContentView.swift
//  IOS-News-App
//
//  Created by Bholanath Barik on 14/07/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActiveSplashScreen = true;
    
    var body: some View {
        VStack {
            if isActiveSplashScreen {
                ZStack {
                    Image(.spalshScreen)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                .padding()
            } else {
                Home()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActiveSplashScreen = false;
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}
