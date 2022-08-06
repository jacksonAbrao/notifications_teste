import 'package:flutter/material.dart';
import 'package:notifications_teste/app/routes/routes.dart';
import 'package:notifications_teste/app/services/firebase_messaging_service.dart';
import 'package:notifications_teste/app/services/notification_service.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    initilizeFirebaseMessaging();
    checkNotifications();
  }

  initilizeFirebaseMessaging() async {
    await Provider.of<FirebaseMessagingService>(context, listen: false)
        .initilize();
  }

  checkNotifications() async {
    await Provider.of<NotificationService>(context, listen: false)
        .checkForNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notification Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: Routes.list,
      initialRoute: Routes.initial,
      navigatorKey: Routes.navigatorKey,
    );
  }
}
