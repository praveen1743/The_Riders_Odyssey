import 'package:flutter_riverpod/flutter_riverpod.dart';

class HealthService extends StateNotifier<List<dynamic>> {
  HealthService() : super([]);
}

final healthServiceProvider =
    StateNotifierProvider<HealthService, List<dynamic>>((ref) {
  return HealthService();
});
{"natural_language_write_file_response": "{"result": "The file was created", "status": "succeeded"}"}