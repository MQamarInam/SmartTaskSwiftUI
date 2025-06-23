//
//  ContentView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 22/06/2025.
//

import SwiftUI

struct LaunchScreen: View {
    
    @State private var isActive = false
    
    var body: some View {
        
        ZStack {
            // Backgrounnd Layer
            Color(red: 1.0, green: 0.88, blue: 0.4).ignoresSafeArea()
            
            // Foreground Layer
            if isActive {
                TaskListView()
            } else {
                VStack {
                    Spacer()
                    Image("launch_screen_logo")
                    Spacer()
                    Image("launch_screen_image")
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    LaunchScreen()
}
