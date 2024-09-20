import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_absensi_app_acm/data/datasources/auth_local_datasource.dart';
import 'package:flutter_absensi_app_acm/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseMessangingRemoteDatasource {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    const initializationSettingsAndroid =
        AndroidInitializationSettings('ic_permission');
    final initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {
          // Implementasi jika ada
        });

    final initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      // Implementasi jika diperlukan
    });

    final fcmToken = await _firebaseMessaging.getToken();

    print('FCM Token: $fcmToken');

    if (fcmToken != null && await AuthLocalDatasource().getAuthData() != null) {
      AuthRemoteDatasource().updateFcmToken(fcmToken);
    }

    FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification?.body);
      print(message.notification?.title);
    });

    FirebaseMessaging.onMessage.listen(firebaseBackgroundHandler);

    // Cek apakah _firebaseMessagingBackgroundHandler tidak null
    if (_firebaseMessagingBackgroundHandler != null) {
      // Daftarkan background handler hanya jika ada dan telah diinisialisasi dengan benar
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(firebaseBackgroundHandler);
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    return flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails('com.rifara.absensi_acm', 'app',
            importance: Importance.max),
        iOS: DarwinNotificationDetails(),
      ),
    );
  }

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // Inisialisasi Firebase jika belum diinisialisasi
    await Firebase.initializeApp();

    // Panggil handler untuk menampilkan notifikasi
    FirebaseMessangingRemoteDatasource().firebaseBackgroundHandler(message);
  }

  Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
    if (message.notification != null) {
      await showNotification(
        title: message.notification!.title,
        body: message.notification!.body,
      );
    }
  }
}
