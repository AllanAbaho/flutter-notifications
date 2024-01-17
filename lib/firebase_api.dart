import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_notifications/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initializeNotifications() async {
    await _firebaseMessaging.requestPermission();
    final _token = await _firebaseMessaging.getToken();
    print(_token);
    pushNotifications();
  }

  void handleMessage(RemoteMessage message) {
    if (message == null) {
      return;
    }
    navigatorkey.currentState.pushNamed('/notification', arguments: message);
  }

  Future pushNotifications() async {
    _firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
