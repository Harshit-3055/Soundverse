//
//  SideMenuView.swift
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

struct SideMenuView: View {
    @Binding var showMenu: Bool
    
    let menuItems: [MenuItem] = [
        MenuItem(title: "Home", icon: "house"),
        MenuItem(title: "My Music", icon: "music.note"),
        MenuItem(title: "Create New", icon: "plus.circle"),
        MenuItem(title: "Explore", icon: "magnifyingglass"),
        MenuItem(title: "Settings", icon: "gear"),
        MenuItem(title: "Help", icon: "questionmark.circle")
    ]
    
    var body: some View {
        ZStack {
            // Semi-transparent background
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation {
                        showMenu = false
                    }
                }
            
            // Menu content
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    // Profile header
                    VStack(alignment: .leading, spacing: 12) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                        
                        Text("Harshit Agrawal")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("@harshittag")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal)
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                    
                    // Menu items
                    ScrollView {
                        VStack(alignment: .leading, spacing: 0) {
                            ForEach(menuItems) { item in
                                Button(action: {
                                    // Handle menu item tap
                                }) {
                                    HStack(spacing: 16) {
                                        Image(systemName: item.icon)
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .frame(width: 24, height: 24)
                                        
                                        Text(item.title)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Spacer()
                                    }
                                    .padding(.vertical, 16)
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    
                    // Logout button
                    Button(action: {
                        // Handle logout
                    }) {
                        HStack(spacing: 16) {
                            Image(systemName: "arrow.right.square")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            
                            Text("Logout")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .padding()
                    }
                }
                .frame(width: 280)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue, Color.purple]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .ignoresSafeArea()
                
                Spacer()
            }
        }
    }
}
