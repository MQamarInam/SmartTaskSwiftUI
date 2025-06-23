//
//  TaskDetailView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 23/06/2025.
//

import SwiftUI

struct TaskDetailView: View {
    
    let task: Task

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(task.title)
        }
        .padding()
        .navigationTitle("Task Detail")
    }
}


#Preview {
    TaskDetailView(task: Task(
        id: "1",
        targetDate: "2025-07-01",
        dueDate: "2025-07-10",
        title: "Sample Task Title",
        description: "This is a sample task description for preview.",
        priority: 1
    ))
}
