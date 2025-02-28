//
//  ContentView.swift
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

struct ContentView: View {
    @State private var showMenu = false
    @State private var showNotifications = false
    @EnvironmentObject var notificationManager: NotificationManager
    
    var body: some View {
        ZStack {
            // Main content
            NavigationView {
                ChatView()
                    .navigationBarItems(
                        leading: Button(action: {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }) {
                            Image(systemName: "person.circle")
                                .font(.system(size: 24))
                        },
                        trailing: Button(action: {
                            showNotifications.toggle()
                        }) {
                            ZStack {
                                Image(systemName: "bell")
                                    .font(.system(size: 24))
                                
                                if notificationManager.badgeCount > 0 {
                                    Text("\(notificationManager.badgeCount)")
                                        .font(.system(size: 12))
                                        .foregroundColor(.white)
                                        .frame(width: 18, height: 18)
                                        .background(Color.red)
                                        .clipShape(Circle())
                                        .offset(x: 10, y: -10)
                                }
                            }
                        }
                    )
                    .navigationBarTitle("Soundverse", displayMode: .inline)
            }
            
            // Side menu
            if showMenu {
                SideMenuView(showMenu: $showMenu)
                    .transition(.move(edge: .leading))
                    .zIndex(1)
            }
            
            // Notification screen
            if showNotifications {
                NotificationView(showNotifications: $showNotifications)
                    .transition(.move(edge: .trailing))
                    .zIndex(2)
            }
        }
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.width > 100 && !showMenu {
                        withAnimation {
                            showMenu = true
                        }
                    } else if gesture.translation.width < -100 && showMenu {
                        withAnimation {
                            showMenu = false
                        }
                    }
                }
        )
        
    }
    
}

