import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notifications_teste/app/routes/routes.dart';
import 'package:notifications_teste/app/services/notification_service.dart';

class FirebaseMessagingService {
  final NotificationService _notificationService;

  FirebaseMessagingService(this._notificationService);

  Future<void> initilize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );
    getDeviceFirebaseToken();
    _onMessage();
    _onMessageOpenedApp();
  }

  getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    debugPrint('======================');
    debugPrint(
        'TOKEN: $token'); //salvar na conta do usuário, lá no banco de dados, pra poder usar pra mandar a notificação, via firebase, bla bla bla
    debugPrint('======================');
  }

  _onMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        _notificationService.showNotification(
          CustomNotification(
            id: android.hashCode,
            title: notification.title!,
            body: notification.body,
            payload: message.data['route'] ?? '',
          ),
        );
      }
    });
  }

  // esses códigos daqui de baixo, é para tratativa de mensagem dentro do firebase

  _onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen(_goToPageAfterMessage);
  }

  _goToPageAfterMessage(message) {
    final String route = message.data['route'] ?? '';
    if (route.isNotEmpty) {
      Routes.navigatorKey?.currentState?.pushNamed(route);
    }
  }
}
