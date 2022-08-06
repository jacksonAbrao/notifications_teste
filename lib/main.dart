import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notifications_teste/app/app.dart';
import 'package:notifications_teste/app/services/firebase_messaging_service.dart';
import 'package:notifications_teste/app/services/notification_service.dart';
import 'package:notifications_teste/firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(
          create: (context) => NotificationService(),
        ),
        Provider<FirebaseMessagingService>(
          create: (context) =>
              FirebaseMessagingService(context.read<NotificationService>()),
        )
      ],
      child: const App(),
    ),
  );
}
