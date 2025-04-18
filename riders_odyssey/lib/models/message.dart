import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'senderId': senderId,
        'content': content,
        'timestamp': timestamp,
      };

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json['id'],
        senderId: json['senderId'],
        content: json['content'],
        timestamp: (json['timestamp'] as Timestamp).toDate(),
      );
}