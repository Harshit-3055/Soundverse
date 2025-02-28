# Soundverse iOS App - Internship Assignment

## Overview

This iOS application is a prototype for Soundverse, an AI-powered music creation platform that transforms text prompts into fully-fledged music compositions. The app focuses on implementing notification handling and profile navigation functionality while maintaining the core identity of Soundverse as an AI music creation tool.

## Key Features

- **Chat Interface**: OpenAI-style message bubbles for entering music generation prompts
- **Side Menu**: Accessible via left swipe gesture or profile icon tap
- **Notification System**: Fully functional notification handling with alerts and badge counts
- **Dedicated Music Pages**: Music player interface when tapping on notifications

## Technical Implementation

The app is built using SwiftUI and includes:

- Custom notification management system
- Side menu with gesture recognition
- Chat interface for music generation prompts
- Follow-up notification functionality (5-second delay after tapping a notification)

## Soundverse Brand Context

Soundverse is an AI Assistant for content creators and music makers.

## Setup Instructions

1. Clone the repository
2. Open the project in Xcode
3. Build and run on an iOS simulator or device

## Project Structure

- **SoundverseApp.swift**: Main app entry point with app delegate
- **ContentView.swift**: Main container view with side menu and navigation
- **ChatView.swift**: The message bubble interface for music prompts
- **SideMenuView.swift**: The side menu implementation
- **NotificationView.swift**: The notification screen
- **DedicatedPageView.swift**: The music player page
- **NotificationManager.swift**: Class to handle notification logic
- **Models.swift**: Contains data models

## About the Developer

This project was developed as part of an internship assignment for Soundverse.

## License

This project is for demonstration purposes only and not licensed for distribution.
