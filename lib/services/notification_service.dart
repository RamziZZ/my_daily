import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  final FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    await notifications.initialize(
      settings: settings,
    );
  }

  Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel',
        'Daily Reminder',
        channelDescription: 'Notification for MyDaily App',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    await notifications.show(
      id: 0,
      title: title,
      body: body,
      notificationDetails: details,
    );
  }
}