import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'featurs/app.dart';
import 'featurs/core/controllers/connection_time.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    /// To Init Firebase
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),

    /// Locale Database
    GetStorage.init(),

    /// init ScreenUtil For Responsive Design
    ScreenUtil.ensureScreenSize()
  ]);

  /// for show last connection
  ConnectionTime.instance.connectTime();

  runApp(const MardodApp());
}
