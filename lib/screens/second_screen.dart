import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String message; // This will hold the data passed from HomeScreen

  const SecondScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(child: Text(message, style: const TextStyle(fontSize: 24))),
    );
  }
}
