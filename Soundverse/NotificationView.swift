//
//  NotificationView.swift
//  Soundverse
//
//  Created by Harshit Agarwal on 28/02/25.
//

import SwiftUI
import UserNotifications
import Combine
import UIKit
import Foundation
import AVFoundation

struct NotificationView: View {
    @Binding var showNotifications: Bool
    @EnvironmentObject var notificationManager: NotificationManager
    
    var body: some View {
        ZStack {
            // Semi-transparent background
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showNotifications = false
                    }
                }
            
            // Notification content
            VStack {
                // Header
                HStack {
                    Button(action: {
                        withAnimation {
                            showNotifications = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Text("Notifications")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                        // Mark all as read
                        for index in notificationManager.notifications.indices {
                            notificationManager.notifications[index].isRead = true
                        }
                        notificationManager.updateBadgeCount()
                    }) {
                        Text("Clear All")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                
                // Notification list
                if notificationManager.notifications.isEmpty {
                    Spacer()
                    Text("No notifications")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    List {
                        ForEach(notificationManager.notifications) { notification in
                            NotificationRow(notification: notification)
                                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                .onTapGesture {
                                    notificationManager.markAsRead(notification: notification)
                                    withAnimation {
                                        showNotifications = false
                                    }
                                    
                                    // Navigate to a dedicated page (simulated)
                                    // In a real app, you would use NavigationLink
                                }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.7)
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(radius: 10)
        }
    }
}

struct NotificationRow: View {
    let notification: NotificationItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Notification icon
            ZStack {
                Circle()
                    .fill(notification.isRead ? Color.gray.opacity(0.3) : Color.blue.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                Image(systemName: "music.note")
                    .font(.system(size: 18))
                    .foregroundColor(notification.isRead ? .gray : .blue)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(notification.title)
                    .font(.headline)
                    .fontWeight(notification.isRead ? .regular : .bold)
                
                Text(notification.message)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                Text(timeAgo(from: notification.timestamp))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if !notification.isRead {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)
            }
        }
        .padding(.vertical, 4)
        .background(notification.isRead ? Color.clear : Color.blue.opacity(0.05))
        .cornerRadius(8)
    }
    
    func timeAgo(from date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.minute, .hour, .day], from: date, to: now)
        
        if let day = components.day, day > 0 {
            return day == 1 ? "Yesterday" : "\(day) days ago"
        } else if let hour = components.hour, hour > 0 {
            return "\(hour) hour\(hour == 1 ? "" : "s") ago"
        } else if let minute = components.minute, minute > 0 {
            return "\(minute) minute\(minute == 1 ? "" : "s") ago"
        } else {
            return "Just now"
        }
    }
}
