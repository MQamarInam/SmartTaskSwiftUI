//
//  EmptyView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 23/06/2025.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        
        ZStack {
            // Backgrounnd Layer
            Color("primary_background")
                .ignoresSafeArea()
            
            // Foreground Layer
            VStack {
                VStack {
                    Image("empty_view_image")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                        .padding(.bottom)
                    
                    Text("No tasks for today!")
                        .padding(.top)
                        .foregroundStyle(Color.white)
                        .font(.amsiProBold(size: 25))
                }
                .padding(.bottom, 70)
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    EmptyView()
}
