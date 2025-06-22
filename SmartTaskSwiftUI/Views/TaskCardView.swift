//
//  TaskCardView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 22/06/2025.
//

import SwiftUI

struct TaskCardView: View {
    
    let task: Task
    let daysLeft: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text(task.title)
                .font(.custom("AmsiPro-Bold", size: 15))
                .foregroundColor(.primary)

            Divider()

            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Due date")
                        .font(.custom("AmsiPro-Regular", size: 10))
                        .foregroundColor(.gray)
                    Text(task.dueDate ?? "N/A")
                        .font(.custom("AmsiPro-Bold", size: 15))
                        .foregroundColor(.primary)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 5) {
                    Text("Days left")
                        .font(.custom("AmsiPro-Regular", size: 10))
                        .foregroundColor(.gray)
                    Text(daysLeft)
                        .font(.custom("AmsiPro-Bold", size: 15))
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
    TaskCardView(
        task: Task(
            id: "1",
            targetDate: "2025-07-01",
            dueDate: "2025-07-10",
            title: "Sample Task Title",
            description: "This is a sample task description for preview.",
            priority: 1
        ),
        daysLeft: "5"
    )
}
