//
//  DedicatedPageView.swift
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

struct DedicatedPageView: View {
    let notification: NotificationItem
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                Text(notification.title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            
            Spacer()
            
            // Content
            VStack(spacing: 24) {
                Image(systemName: "waveform")
                    .font(.system(size: 100))
                    .foregroundColor(.blue)
                
                Text(notification.message)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Simulated music player
                VStack(spacing: 16) {
                    // Progress bar
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 6)
                            .foregroundColor(Color.gray.opacity(0.3))
                            .cornerRadius(3)
                        
                        Rectangle()
                            .frame(width: 120, height: 6)
                            .foregroundColor(.blue)
                            .cornerRadius(3)
                    }
                    .padding(.horizontal)
                    
                    // Controls
                    HStack(spacing: 40) {
                        Button(action: {}) {
                            Image(systemName: "backward.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.primary)
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "play.fill")
                                .font(.system(size: 36))
                                .foregroundColor(.primary)
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "forward.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .padding(.horizontal)
            }
            
            Spacer()
            
            // Action buttons
            HStack(spacing: 20) {
                Button(action: {}) {
                    VStack {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 20))
                        Text("Share")
                            .font(.caption)
                    }
                    .foregroundColor(.primary)
                }
                
                Button(action: {}) {
                    VStack {
                        Image(systemName: "heart")
                            .font(.system(size: 20))
                        Text("Like")
                            .font(.caption)
                    }
                    .foregroundColor(.primary)
                }
                
                Button(action: {}) {
                    VStack {
                        Image(systemName: "text.bubble")
                            .font(.system(size: 20))
                        Text("Comment")
                            .font(.caption)
                    }
                    .foregroundColor(.primary)
                }
                
                Button(action: {}) {
                    VStack {
                        Image(systemName: "arrow.down.circle")
                            .font(.system(size: 20))
                        Text("Download")
                            .font(.caption)
                    }
                    .foregroundColor(.primary)
                }
            }
            .padding(.bottom, 30)
        }
        .navigationBarHidden(true)
    }
}
