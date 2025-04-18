import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riders_odyssey/models/message.dart';
import 'package:riders_odyssey/models/ride.dart';


part 'database_provider.g.dart';

@riverpod
DatabaseService databaseService(DatabaseServiceRef ref) {
  return DatabaseService();
}

class DatabaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(
      {required String rideId, required String text, required String senderId}) async {
    final message = Message(
      id: '', // Firestore will generate an ID
      text: text,
      senderId: senderId,
      timestamp: DateTime.now(),
    );

    try {
      final docRef = await _firestore
          .collection('rides')
          .doc(rideId)
          .collection('messages')
          .add(message.toJson());

      // Update the message ID with the Firestore-generated ID
      await docRef.update({'id': docRef.id});
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  Future<List<Message>> getMessages(String rideId) async {
    try {
      final querySnapshot = await _firestore
          .collection('rides')
          .doc(rideId)
          .collection('messages')
          .orderBy('timestamp')
          .get();
      return querySnapshot.docs
          .map((doc) => Message.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to get messages: $e');
    }
  }

  Future<String> createRide(Ride ride) async {
    try {
      final docRef = await _firestore.collection('rides').add(ride.toJson());
      await docRef.update({'id': docRef.id}); // Store the document ID in the ride object
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to create ride: $e');
    }
  }

  Future<Ride?> getRide(String rideId) async {
    try {
      final docSnapshot = await _firestore.collection('rides').doc(rideId).get();
      if (docSnapshot.exists) {
        return Ride.fromJson(docSnapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to get ride: $e');
    }
  }
}