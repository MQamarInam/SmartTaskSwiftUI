//
//  MockTaskRepository.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 22/06/2025.
//

import Foundation

class MockTaskRepository: TaskRepositoryType {
    func fetchTasks(completion: @escaping DataResponse) {
        guard let url = Bundle.main.url(forResource: "task_response", withExtension: "json") else {
            return completion(.failure(NSError(domain: "", code: 404)))
        }

        do {
            let data = try Data(contentsOf: url)
            let tasks = try JSONDecoder().decode(TaskResponse.self, from: data)
            completion(.success(tasks))
        } catch {
            completion(.failure(error as NSError))
        }
    }
}
