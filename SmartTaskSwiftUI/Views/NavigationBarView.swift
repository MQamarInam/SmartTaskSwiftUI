//
//  NavigationBarView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 23/06/2025.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack {
            Button(action: {
                // Previous action
            }) {
                Image("left_arrow")
                    .font(.title2)
                    .foregroundColor(.white)
            }

            Spacer()

            Text("Today")
                .font(.amsiProBold(size: 15))
                .foregroundColor(.white)
                .bold()

            Spacer()

            Button(action: {
                // Next action
            }) {
                Image("right_arrow")
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
        
    }
}

#Preview {
    NavigationBarView()
}
