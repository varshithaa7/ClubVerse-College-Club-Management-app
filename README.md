# Club Management System

This repository contains the codebase for the **Club Management System** app designed to streamline club activities, recruitment processes, and event management at RV College of Engineering.

---

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

---

## Introduction
The **Club Management System** is a Flutter-based app integrated with Firebase for backend services. The app provides role-based functionalities for different types of users:

1. **Members**: View announcements, events, and club details.
2. **Club Heads**: Manage club-specific announcements, recruitment processes, and events.
3. **Faculty Heads**: Monitor overall club activities and approve budgets.

---

## Features
- **Role-Based Access**:
  - Club Heads can add announcements for their respective clubs.
  - Members can only view announcements.
- **Event Management**:
  - Create, view, and manage events with RSVP options.
- **Recruitment Processes**:
  - Post recruitment announcements and manage applications.
- **Collaboration Hub**:
  - Facilitate joint projects and events between clubs.
- **Real-Time Notifications**:
  - Keep users updated with real-time notifications for events and announcements.

---

## Tech Stack
### **Frontend**:
- **Flutter**: Framework for building cross-platform applications.

### **Backend**:
- **Firebase**:
  - Authentication
  - Firestore for database management
  - Cloud Messaging for notifications

---

## Installation

### Prerequisites
- Flutter installed on your system ([Flutter Installation Guide](https://flutter.dev/docs/get-started/install))
- Firebase project set up ([Firebase Setup Guide](https://firebase.google.com/docs/flutter/setup))

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/<your-username>/club-management-system.git
   cd club-management-system
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**:
   - Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) from your Firebase project.
   - Place these files in the respective `android/app` and `ios/Runner` directories.

4. **Run the App**:
   ```bash
   flutter run
   ```

---

## Usage
1. **Login**:
   - Use the authentication screen to log in as a member, club head, or faculty head.
2. **Announcements**:
   - Club heads can add announcements for their respective clubs.
   - Members can view announcements based on their club affiliations.
3. **Events**:
   - Create or RSVP to events.
4. **Recruitment**:
   - Post or view recruitment announcements.

---

## Project Structure
```
club-management-system/
├── lib/
│   ├── main.dart          # Entry point of the application
│   ├── screens/           # All UI screens (Login, Dashboard, etc.)
│   ├── widgets/           # Reusable Flutter widgets
│   ├── services/          # Firebase integration logic
│   └── models/            # Data models (User, Club, Announcement, etc.)
├── android/               # Android-specific files
├── ios/                   # iOS-specific files
├── assets/                # App assets (images, fonts, etc.)
├── pubspec.yaml           # Flutter dependencies
└── README.md              # Documentation
```

---



---

## License
This project is licensed under the [MIT License](LICENSE).

