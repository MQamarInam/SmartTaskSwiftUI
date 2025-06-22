//
//  TaskRepositoryType.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 22/06/2025.
//

import Foundation

typealias DataResponse = (Result<TaskResponse, NSError>) -> Void

protocol TaskRepositoryType {
    func fetchTasks(completion: @escaping DataResponse)
}

