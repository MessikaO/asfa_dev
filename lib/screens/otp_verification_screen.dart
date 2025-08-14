import 'package:flutter/material.dart';

class OTPVerificationScreen extends StatelessWidget {
  final String phoneNumber;
  const OTPVerificationScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Code'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the code sent to $phoneNumber',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: '6-digit code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // For now, just go back to home
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Verify', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
