//
//  TaskCardView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 22/06/2025.
//

import SwiftUI

struct TaskCardView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Title")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.primary)
            
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Due date")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("2025-7-15")
                        .font(.headline)
                        .foregroundColor(.primary)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 5) {
                    Text("Days left")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("20")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
        .padding(.horizontal)
        
    }
}

#Preview {
    TaskCardView()
}
