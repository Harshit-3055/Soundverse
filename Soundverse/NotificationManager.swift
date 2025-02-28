//
//  NotificationManager.swift
//  Soundverse
//
//  Created by Harshit Agarwal on 28/02/25.
//

import SwiftUI
import UserNotifications

class NotificationManager: ObservableObject {
    @Published var notifications: [NotificationItem] = []
    @Published var badgeCount: Int = 0
    
    init() {
        // Add some dummy notifications
        addDummyNotifications()
    }
    
    func addDummyNotifications() {
        let dummyNotifications = [
            NotificationItem(title: "New Beat Created", message: "Your 'Summer Vibes' beat is ready to listen", timestamp: Date().addingTimeInterval(-3600)),
            NotificationItem(title: "Trending Alert", message: "Your track 'Midnight Dreams' is trending", timestamp: Date().addingTimeInterval(-7200)),
            NotificationItem(title: "Collaboration Request", message: "User @musicpro wants to collaborate", timestamp: Date().addingTimeInterval(-86400))
        ]
        
        notifications.append(contentsOf: dummyNotifications)
        updateBadgeCount()
    }
    
    func addNotification(title: String, message: String) {
        let newNotification = NotificationItem(title: title, message: message, timestamp: Date())
        notifications.insert(newNotification, at: 0)
        updateBadgeCount()
        
        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.sound = .default
        
        // Create trigger (almost immediate delivery)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        // Create request with unique identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // Add request to notification center
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }
    
    func markAsRead(notification: NotificationItem) {
        if let index = notifications.firstIndex(where: { $0.id == notification.id }) {
            notifications[index].isRead = true
        }
        updateBadgeCount()
        
        // Schedule another notification after 5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let title = "Follow-up Notification"
            let message = "This is a follow-up to your recent activity"
            
            self.addNotification(title: title, message: message)
        }
    }
    
    func updateBadgeCount() {
        badgeCount = notifications.filter { !$0.isRead }.count
        UIApplication.shared.applicationIconBadgeNumber = badgeCount
    }
}
