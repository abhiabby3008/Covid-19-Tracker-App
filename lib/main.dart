import 'package:covidtracker/screens/SplashScreen/components/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

/// Top-level background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // Handle background notification
  print('Background message received: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAHr1mvhrbowWs47cCnSxq-SKUuY9-xqxU",
          appId: "1:246871399954:android:65ac6e621786c2e723c2cb",
          messagingSenderId: "246871399954",
          projectId: "covidtracker-7394b"));

  // Get the token for this device
  String? token = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $token');
  // Set background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Foreground message handler
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null) {
      print(
          'Foreground message received: ${notification.title} - ${notification.body}');
      // TODO: display a local notification using flutter_local_notifications
    }
  });

  // Handling message when app is opened from a notification
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Notification clicked: ${message.notification?.title}');
    // TODO: navigate to specific screen, e.g.:
    // Get.to(() => DetailScreen(message: message));
  });
// Request notification permissions (iOS/macOS)
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

  runApp(const MyApp());
}

String fcmtocken =
    "f6AT-EoPT96-_5JDCJQ72p:APA91bH5JBrM3oBlcux4X3l0ZsNjFIp7A-5NVwscTbmsahWqAyYDbloSyEPJjoyiIxXJIiK6jpid1Zpiz1N4aHS95R_UCZRkJLKOWMvgxX2GJU0rAhKNngQ";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}
