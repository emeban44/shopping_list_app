## Goal of the application:

The goal of this application is making everyday shopping easier with simple shopping item tracking features such as:
Adding, Deleting and Collecting Shopping Items. 
The UI/UX must be intiutive and featherlight to provide an easy-to-use user feeling.

## How to compile and run the application

**Plugins and SDK needed to compile:**
- Flutter and Dart SDKs
- Firebase cloud_firestore and firebase_core plugins
- Android SDK
- Xcode
- Device emulator/simulator
- Visual Studio Code

**Steps for running the app:**
1. Open project in VSCode
2. Open Android or iOS emulator
3. Click 'Run without debugging' in the VSCode top bar

## How to run tests for the application

Unfortunately, I never ran Unit Tests for Flutter apps(will learn to do soon) but I have done them in Java, so I will just write hypothetical tests.

**Tests:**
1. Add item test
2. Delete item test
3. Collect item test
4. Sorting by date test
5. New item form validation test

## Application Architecture

The Application uses built-in and custom Flutter widgets for the frontend with Flutter provider and firebase packages for the backend. Home page is split into 3 tabs that are all connected to a Shopping Provider who listens and provides data through the whole application. The app runs both on iOS and Android.

## App Video Demonstration

App usage demonstration video: https://www.youtube.com/watch?v=QMbnOJjt61Y


