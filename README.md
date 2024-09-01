# Messenger

A Flutter-based multi-user chat application that supports real-time messaging using Firebase Firestore and Authentication. This app allows users to sign in with email/password or Google and engage in real-time chat with other users.

## Table of Contents

1. [Features](#features)
2. [Screenshots](#screenshots)
3. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
   - [Project Structure](#project-structure)
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)
7. [Contact](#contact)

## Features

- **Firebase Authentication**: Sign up and log in with email/password or Google.
- **Real-Time Messaging**: Chat with other users in real-time.
- **Firestore Integration**: Store and retrieve messages and user information.
- **Responsive UI**: A clean, user-friendly interface that works seamlessly on various devices.
- **Scalable**: Built with Firebase, making it easy to scale as your user base grows.

## Screenshots

![1](https://github.com/user-attachments/assets/865ea2c8-b68f-4dc0-a8ad-8feb9a0cfa72)

- **Figure 1**:

![2](https://github.com/user-attachments/assets/8b67af20-a1ac-483f-92a0-f87bf8dbe4b5)

- **Figure 2**:

![3](https://github.com/user-attachments/assets/d97db279-9584-4a45-96c1-b4ede4c32ad2)

## Getting Started

### Prerequisites

- **Flutter SDK**: [Installation guide](https://flutter.dev/docs/get-started/install)
- **Firebase account**: [Firebase Console](https://console.firebase.google.com/)

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/sharansukesh1003/messenger.git
   cd messenger
   ```

2. **Set up Firebase**:

   - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
   - Add your Android and/or iOS app to the Firebase project.
   - Download `google-services.json` (for Android) and/or `GoogleService-Info.plist` (for iOS) and place them in the appropriate directories:
     - `android/app/google-services.json`
     - `ios/Runner/GoogleService-Info.plist`
   - Enable Email/Password and Google sign-in methods in the Authentication section of Firebase.
   - Set up Firestore as your database and adjust the rules as needed.

3. **Install dependencies**:

   ```bash
   flutter pub get
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

### Project Structure

```bash
lib/
│
├── models/
│   ├── chat_screen_arguments_model.dart   # Data model for passing chat arguments
│   └── message_model.dart                 # Data model for chat messages
│
├── screens/
│   ├── chat_screen.dart                   # UI for the chat interface
│   ├── home_screen.dart                   # UI for displaying user list
│   ├── login_screen.dart                  # UI for user login
│   └── signup_screen.dart                 # UI for user signup
│
├── service/
│   ├── authentication.dart                # Firebase authentication service
│   └── message_service.dart               # Firestore message handling service
│
├── widgets/
│   └── message_bubble.dart                # Widget for displaying chat messages
│
└── main.dart                              # Main entry point of the app
```

## Usage

- **Sign Up**: Users can sign up using their email and password or through Google sign-in.
- **Login**: Once registered, users can log in and start chatting.
- **Chat**: Users can select other users from the list and start a conversation in real-time.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request for any changes you'd like to see.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

If you have any questions or suggestions, feel free to open an issue or reach out to me on [LinkedIn](https://www.linkedin.com/in/sharan-sukesh-0a0b77157/).
