// Import Firebase core package for initializing Firebase services, which includes authentication, Firestore database, cloud functions, and more.
import 'package:firebase_core/firebase_core.dart';

// Import Flutter's Material library for building a Material Design-based user interface with widgets like buttons, text fields, and layouts.
import 'package:flutter/material.dart';

// Import flutter_screenutil to make the app responsive across different screen sizes by providing adaptive widgets and measurements.
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Import GetStorage, a lightweight key-value storage package that allows for fast and easy local data persistence without complex database operations.
import 'package:get_storage/get_storage.dart';

// Import the Firebase options that are auto-generated during project setup. These options contain platform-specific configurations for Firebase initialization.
import 'firebase_options.dart';

// Import the main application widget from the features folder,
// which serves as the entry point and structure for the app's UI and navigation.
import 'featurs/app.dart';

// Import the ConnectionTime controller, which manages the tracking and updating of the user's last connection time, ensuring that session times are recorded accurately.
import 'featurs/core/controllers/connection_time.dart';

// Main function to initialize the app
Future<void> main() async {
  // Ensure that all widgets are properly initialized before running the app,
  // especially for binding platform channels and services.
  WidgetsFlutterBinding.ensureInitialized();

  // Run multiple asynchronous initializations concurrently to reduce startup time.
  await Future.wait([
    // Initialize Firebase with platform-specific options.
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    // Initialize GetStorage for local data storage.
    GetStorage.init(),
    // Ensure that screen dimensions are available for responsive UI layout.
    ScreenUtil.ensureScreenSize()
  ]);

  // Call a method from ConnectionTime singleton instance to track and log the user's last connection time, useful for analytics and user session management.
  ConnectionTime.instance.connectTime();

  // Launch the main application widget, MardodApp, which builds and renders the app's user interface and manages the app's lifecycle.
  runApp(const MardodApp());
}
