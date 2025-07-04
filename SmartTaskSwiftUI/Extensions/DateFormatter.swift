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
        formatter.dateFormat = "yyyy-MM-dd" // Adjust if your format is different
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0) // optional
        return formatter
    }()
    
    static let readableDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium // Example: Jun 23, 2025
        formatter.timeStyle = .none
        return formatter
    }()
}
