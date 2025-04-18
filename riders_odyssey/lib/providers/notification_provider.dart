import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'notification_provider.g.dart'; // Make sure this part file exists

@riverpod
class NotificationNotifier extends _$NotificationNotifier {
  @override
  Future<PermissionStatus> build() async {
    return await Permission.notification.status; // Use Permission.notification
  }

  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request(); // Use Permission.notification
    state = AsyncData(status); // Update state with AsyncData
    if (status.isPermanentlyDenied) { // Check if permanently denied
      await openAppSettings(); // Open app settings
    }
  }
}
