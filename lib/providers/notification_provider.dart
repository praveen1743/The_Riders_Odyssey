import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final notificationProvider = StateNotifierProvider<NotificationNotifier, FlutterLocalNotificationsPlugin>((ref) {
  return NotificationNotifier();
});

class NotificationNotifier extends StateNotifier<FlutterLocalNotificationsPlugin> {
  NotificationNotifier() : super(FlutterLocalNotificationsPlugin()) {
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon'); // Replace 'app_icon' with your app's icon name
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid);
    await state.initialize(initializationSettings);
  }

  // Add methods to schedule and cancel notifications as needed
  }
}