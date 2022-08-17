import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEBECED),
        foregroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('Contact'),
      ),
    );
  }
}
