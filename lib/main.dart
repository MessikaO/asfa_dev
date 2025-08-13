import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ASFA App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ASFA'), centerTitle: true),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min, // keeps it tight, not full width
          children: const [
            Icon(Icons.home, size: 30, color: Colors.blue),
            SizedBox(width: 10), // space between icon and text
            Text('Welcome to ASFA!', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
