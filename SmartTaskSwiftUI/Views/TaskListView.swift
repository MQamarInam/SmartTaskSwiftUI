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
                    NavigationBarView(
                        title: viewModel.dateTitle,
                        onPrevious: { viewModel.goToPreviousDay() },
                        onNext: { viewModel.goToNextDay() }
                    )
                    
                    if viewModel.tasksForSelectedDate.isEmpty {
                        VStack(spacing: 10) {
                            EmptyView()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        List(viewModel.tasksForSelectedDate) { task in
                            Button {
                                selectedTask = task
                            } label: {
                                TaskCardView(task: task, viewModel: viewModel)
                                    .padding(.vertical, -5)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color("primary_background"))
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(PlainListStyle())
                        .scrollContentBackground(.hidden)
                    }
                }
                .background(Color("primary_background").ignoresSafeArea())
                .onAppear {
                    viewModel.loadTasks()
                }
                .navigationDestination(item: $selectedTask) { task in
                    TaskDetailView(task: task, viewModel: viewModel)
                }
            }
        }
        
    }
}

#Preview {
    TaskListView()
}
