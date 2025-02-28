//
//  ChatView.swift
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
struct ChatView: View {
    @State private var messageText = ""
    @State private var messages: [Message] = [
        Message(content: "Welcome to Soundverse! I can help you create AI-generated music. Just describe what you're looking for.", isUser: false, timestamp: Date().addingTimeInterval(-300)),
        Message(content: "I'd like a chill lofi beat with piano and soft drums", isUser: true, timestamp: Date().addingTimeInterval(-240))
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(messages) { message in
                        ChatBubble(message: message)
                    }
                }
                .padding()
            }
            
            HStack {
                TextField("Type a message...", text: $messageText)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(20)
                
                Button(action: sendMessage) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .background(Color(.systemGray6).opacity(0.3))
    }
    
    func sendMessage() {
        guard !messageText.isEmpty else { return }
        
        let newMessage = Message(content: messageText, isUser: true, timestamp: Date())
        messages.append(newMessage)
        messageText = ""
        
        // Simulate AI response
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let responseMessage = Message(
                content: "I'm creating a chill lofi beat with piano and soft drums for you. This will take a moment to generate...",
                isUser: false,
                timestamp: Date()
            )
            messages.append(responseMessage)
        }
    }
}

struct ChatBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
                
                Text(message.content)
                    .padding(12)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(16)
                    .cornerRadius(16, corners: [.topRight, .bottomLeft, .bottomRight])
            } else {
                Text(message.content)
                    .padding(12)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(16)
                    .cornerRadius(16, corners: [.topLeft, .topRight, .bottomRight])
                
                Spacer()
            }
        }
    }
}

// Extension to create custom corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
