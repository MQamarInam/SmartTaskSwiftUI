//
//  TaskListView.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 22/06/2025.
//

import SwiftUI

struct TaskListView: View {
    
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        
        VStack {
            VStack {
                List(viewModel.tasks) { task in
                    TaskCardView(task: task, daysLeft: viewModel.calculateDaysLeft(from: task.dueDate))
                        .listRowBackground(Color(red: 1.0, green: 0.88, blue: 0.4))
                        .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
            }
            .padding(.top)
        }
        .background(Color(red: 1.0, green: 0.88, blue: 0.4).ignoresSafeArea()) // #FFE066
        .onAppear {
            viewModel.loadTasks()
        }
        
    }
}

#Preview {
    TaskListView()
}
