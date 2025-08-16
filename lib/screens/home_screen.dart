import 'package:flutter/material.dart';
import 'phone_auth_screen.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الرئيسية')),
      body: Center(
        child: CustomButton(
          label: 'الانتقال إلى الصفحة 2',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PhoneAuthScreen()),
            );
          },
        ),
      ),
    );
  }
}
