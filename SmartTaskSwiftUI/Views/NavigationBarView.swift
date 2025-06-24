//
//  NavigationBarView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 23/06/2025.
//

import SwiftUI

struct NavigationBarView: View {
    
    let title: String
    let onPrevious: () -> Void
    let onNext: () -> Void
    
    var body: some View {
        
        HStack {
            Button(action: onPrevious) {
                Image("left_arrow")
                    .font(.title2)
                    .foregroundColor(.white)
            }

            Spacer()

            Text(title)
                .font(.amsiProBold(size: 15))
                .foregroundColor(.white)

            Spacer()

            Button(action: onNext) {
                Image("right_arrow")
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 10)
        
    }
}

#Preview {
    NavigationBarView(
        title: "Today",
        onPrevious: {
            print("Previous tapped")
        },
        onNext: {
            print("Next tapped")
        }
    )
    .background(Color.black) // optional for visibility in preview
}

