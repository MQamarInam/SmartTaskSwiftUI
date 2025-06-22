//
//  TaskModel.swift
//  Smart tasks
//
//  Created by Umair on 21/06/2025.

import Foundation

struct TaskResponse: Codable {
    let tasks: [Task]
}

struct Task: Codable, Identifiable {
    let id: String
    let targetDate: String
    let dueDate: String?
    let title: String
    let description: String
    let priority: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case targetDate = "TargetDate"
        case dueDate = "DueDate"
        case title = "Title"
        case description = "Description"
        case priority = "Priority"
    }
}
