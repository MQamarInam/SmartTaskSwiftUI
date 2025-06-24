//
//  UserDefault.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 24/06/2025.
//

import Foundation

extension UserDefaults {
    
    private var taskStatusKey: String { "TaskResolutionStatuses" }
    
    func saveStatus(_ status: TaskResolutionStatus, for id: String) {
        var allStatuses = getAllStatuses()
        allStatuses[id] = status.rawValue
        if let data = try? JSONEncoder().encode(allStatuses) {
            set(data, forKey: taskStatusKey)
        }
    }
    
    func getStatus(for id: String) -> TaskResolutionStatus {
        let allStatuses = getAllStatuses()
        if let statusString = allStatuses[id],
           let status = TaskResolutionStatus(rawValue: statusString) {
            return status
        }
        return .unresolved
    }
    
    private func getAllStatuses() -> [String: String] {
        if let data = data(forKey: taskStatusKey),
           let decoded = try? JSONDecoder().decode([String: String].self, from: data) {
            return decoded
        }
        return [:]
    }
    
}
