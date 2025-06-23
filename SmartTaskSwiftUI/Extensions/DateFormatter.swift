//
//  DateFormatter.swift
//  SmartTaskSwiftUI
//
//  Created by Qaim's Macbook  on 23/06/2025.
//

import SwiftUI

extension DateFormatter {
    static let taskDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
