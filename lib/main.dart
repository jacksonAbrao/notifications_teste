import 'package:flutter/material.dart';
import 'package:notifications_teste/app/app.dart';
import 'package:notifications_teste/app/services/notification_service.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(
            create: (context) => NotificationService()),
      ],
      child: const App(),
    ),
  );
}
