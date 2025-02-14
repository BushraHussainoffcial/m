// Importing necessary packages and files for the MardodApp.
// Flutter's material design library for building UI components.
import 'package:flutter/material.dart';

// Package for responsive UI design, allowing the app to adapt to different screen sizes.
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package for state management, dependency injection, and navigation.
import 'package:get/get.dart';

// ProfileController for managing profile-related logic and state.
import 'profile/controller/profile_controller.dart';

// RecordScreen for displaying the record-related UI.
import 'record/screens/record_screen.dart';

// Constants file containing app-wide constants like design sizes.
import '../core/constants.dart';

// Strings file containing app-wide text and labels.
import '../core/strings.dart';

// ThemeManager for managing the app's theme and styling.
import '../core/theme_manager.dart';

// SplashScreen for displaying the initial loading screen when the app starts.
import 'splash/splash_screen.dart';

// Main application class, MardodApp, which is a StatelessWidget.
// This class serves as the entry point for the app's UI and configuration.
class MardodApp extends StatelessWidget {
  // Constructor for MardodApp. The `super.key` is used to pass the key to the parent class.
  const MardodApp({super.key});

  // Override the `build` method to define the app's UI structure.
  @override
  Widget build(BuildContext context) {
    // Initialize the ProfileController using GetX's dependency injection system.
    // This makes the controller available throughout the app.
    Get.put(ProfileController());

    // Use ScreenUtilInit to initialize responsive design settings.
    // This ensures the app adapts to different screen sizes and orientations.
    return ScreenUtilInit(
      // Enable text scaling adaptation for better readability on different devices.
      minTextAdapt: true,

      // Set the design size for the app. This is used as a reference for scaling.
      designSize: const Size(
        Constants.widthSize, // Width of the design (from constants).
        Constants.heightSize, // Height of the design (from constants).
      ),

      // Builder function to create the app's UI.
      builder: (context, child) {
        // Return GetMaterialApp, which is a wrapper around MaterialApp with GetX features.
        return GetMaterialApp(
          // Set the app's locale to Arabic for language and text direction.
          locale: const Locale('ar'),

          // Disable the red debug banner in the top-right corner of the app.
          debugShowCheckedModeBanner: false,

          // Set the app's title using the app name from the strings file.
         title: Strings.appName,

          // Apply the custom theme defined in ThemeManager.
          theme: ThemeManager.myTheme,

          // Set the initial screen of the app to the SplashScreen.
          home: const SplashScreen(),

          // Define named routes for navigation within the app.
          routes: {
            // Route for navigating to the RecordScreen.
            '/recordRoute': (_) => RecordScreen(),
          },
        ); // End of GetMaterialApp.
      }, // End of builder function.
    ); // End of ScreenUtilInit.
  } // End of build method.
} // End of MardodApp class.