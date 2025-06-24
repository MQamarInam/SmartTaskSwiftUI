//
//  TaskViewModel.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 22/06/2025.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    @Published var selectedDate: Date = Date()
    private var repository: TaskRepositoryType

    init(repository: TaskRepositoryType = MockTaskRepository()) {
        self.repository = repository
    }

    func loadTasks() {
        repository.fetchTasks { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let response):
                self.tasks = response.tasks
            case .failure(let error):
                print("❌ Error fetching tasks: \(error)")
            }
        }
    }

    func calculateDaysLeft(from dueDate: String?) -> String {
        guard let dueDate,
              let date = DateFormatter.taskDateFormatter.date(from: dueDate) else {
            return "N/A"
        }

        let today = Calendar.current.startOfDay(for: Date())
        let due = Calendar.current.startOfDay(for: date)

        let components = Calendar.current.dateComponents([.day], from: today, to: due)
        guard let days = components.day else { return "N/A" }
        return "\(days)"
    }
    
    func goToPreviousDay() {
        selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? selectedDate
    }

    func goToNextDay() {
        selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? selectedDate
    }

    var tasksForSelectedDate: [Task] {
        tasks.filter {
            guard let taskDate = DateFormatter.taskDateFormatter.date(from: $0.targetDate) else { return false }
            return Calendar.current.isDate(taskDate, inSameDayAs: selectedDate)
        }
    }

    var dateTitle: String {
        if Calendar.current.isDateInToday(selectedDate) {
            return "Today"
        } else {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter.string(from: selectedDate)
        }
    }
    
}
