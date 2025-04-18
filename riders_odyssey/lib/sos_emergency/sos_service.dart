import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SosService {
  Future<void> sendEmergencyMessage(String message, String phoneNumber) async {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: <String, String>{
        'body': Uri.encodeComponent(message),
      },
    );
    if (await canLaunchUrl(smsLaunchUri)) {
      await launchUrl(smsLaunchUri);
    } else {
      throw 'Could not launch $smsLaunchUri';
    }
  }

  Future<void> makeEmergencyCall(String phoneNumber) async {
    final Uri callLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(callLaunchUri)) {
      await launchUrl(callLaunchUri);
    } else {
      throw 'Could not launch $callLaunchUri';
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}