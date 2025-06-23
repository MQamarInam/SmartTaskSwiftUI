//
//  TaskListView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 22/06/2025.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject private var viewModel = TaskViewModel()
    @State private var selectedTask: Task?
    
    var body: some View {

        NavigationStack {
            VStack {
                VStack {
                    List(viewModel.tasks) { task in
                        Button {
                            selectedTask = task
                        } label: {
                            TaskCardView(task: task, daysLeft: viewModel.calculateDaysLeft(from: task.dueDate)
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color(red: 1.0, green: 0.88, blue: 0.4))
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
                }
            }
            .background(Color(red: 1.0, green: 0.88, blue: 0.4).ignoresSafeArea())
            .onAppear {
                viewModel.loadTasks()
            }
            .navigationTitle("Tasks")
            .navigationDestination(item: $selectedTask) { task in
                TaskDetailView(task: task)
            }
        }
        
    }
}

#Preview {
    TaskListView()
}
