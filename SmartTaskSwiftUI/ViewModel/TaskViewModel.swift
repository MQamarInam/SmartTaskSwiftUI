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

    func calculateDaysLeft(from dueDate: String?, comparedTo targetDate: String? = nil) -> String {
        let formatter = DateFormatter.taskDateFormatter
        
        guard let dueDate,
              let due = formatter.date(from: dueDate) else {
            return "N/A"
        }
        // If targetDate is provided, use it as the base date, else use today
        let baseDate: Date
        if let target = targetDate, let parsedTarget = formatter.date(from: target) {
            baseDate = parsedTarget
        } else {
            baseDate = Date()
        }

        let startOfBase = Calendar.current.startOfDay(for: baseDate)
        let startOfDue = Calendar.current.startOfDay(for: due)

        let components = Calendar.current.dateComponents([.day], from: startOfBase, to: startOfDue)
        guard let days = components.day else { return "N/A" }
        return "\(days)"
    }

    
    func goToPreviousDay() {
        selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? selectedDate
    }

    func goToNextDay() {
        selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? selectedDate
    }

//        .sorted {
//            if ($0.priority ?? 0) == ($1.priority ?? 0) {
//                return $0.title < $1.title
//            } else {
//                return ($0.priority ?? 0) > ($1.priority ?? 0)
//            }
//        }

//    var tasksForSelectedDate: [Task] {
//        tasks.filter {
//            guard let taskDate = DateFormatter.taskDateFormatter.date(from: $0.targetDate) else { return false }
//            return Calendar.current.isDate(taskDate, inSameDayAs: selectedDate)
//        }
//    }
    
    var tasksForSelectedDate: [Task] {
        tasks
            .filter {
                guard let taskDate = DateFormatter.taskDateFormatter.date(from: $0.targetDate) else { return false }
                return Calendar.current.isDate(taskDate, inSameDayAs: selectedDate)
            }
            .sorted {
                ($0.priority ?? 0) > ($1.priority ?? 0)
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
