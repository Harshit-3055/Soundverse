//
//  Models.swift
//  Soundverse
//
//  Created by Harshit Agarwal on 28/02/25.
//

import Foundation

// Message Model
struct Message: Identifiable {
    let id = UUID()
    let content: String
    let isUser: Bool
    let timestamp: Date
}

// Notification Model
struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let timestamp: Date
    var isRead: Bool = false
}

// Menu Item Model
struct MenuItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}
