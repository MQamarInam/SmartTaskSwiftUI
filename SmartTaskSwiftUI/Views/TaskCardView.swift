//
//  TaskCardView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 22/06/2025.
//

import SwiftUI

struct TaskCardView: View {
    
    let task: Task
    @ObservedObject var viewModel: TaskViewModel
    
    var body: some View {
        
        let daysLeft = viewModel.calculateDaysLeft(from: task.dueDate, comparedTo: task.targetDate)
        
        VStack(alignment: .leading, spacing: 10) {
            Text(task.title)
                .font(.amsiProBold(size: 15))
                .foregroundColor(Color("failure"))

            Divider()

            HStack {
                VStack(alignment: .leading, spacing: 7) {
                    Text("Due date")
                        .font(.amsiProRegular(size: 10))
                        .foregroundColor(.gray)
                    Text(task.dueDate ?? "N/A")
                        .font(.amsiProBold(size: 15))
                        .foregroundColor(Color("failure"))
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 7) {
                    Text("Days left")
                        .font(.amsiProRegular(size: 10))
                        .foregroundColor(.gray)
                    Text(daysLeft)
                        .font(.amsiProBold(size: 15))
                        .foregroundColor(Color("failure"))
                }
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(5)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
        
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
        viewModel: TaskViewModel()
    )
}
