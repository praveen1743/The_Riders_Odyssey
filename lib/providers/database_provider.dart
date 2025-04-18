import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/message.dart';

class CommunityStateNotifier extends StateNotifier<List<Message>> {
  CommunityStateNotifier() : super([]);
}

final communityProvider =
    StateNotifierProvider<CommunityStateNotifier, List<Message>>(
        (ref) => CommunityStateNotifier());