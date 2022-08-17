import 'package:flutter/material.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Emergency Directory'),
          backgroundColor: const Color(0xFFEBECED),
          foregroundColor: Colors.black),
      body: const Center(
        child: Text('Select your City . Emergency Services'),
      ),
    );
  }
}
