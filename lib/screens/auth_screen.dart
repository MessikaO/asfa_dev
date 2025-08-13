import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  String? verificationId;
  String role = 'client'; // default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول برقم الهاتف')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'رقم الهاتف',
                  hintText: '+213xxxxxxxxx',
                ),
              ),
              const SizedBox(height: 20),

              // Role selection dropdown
              DropdownButtonFormField<String>(
                value: role,
                items: const [
                  DropdownMenuItem(value: 'client', child: Text('عميل')),
                  DropdownMenuItem(value: 'provider', child: Text('مزود')),
                  DropdownMenuItem(value: 'admin', child: Text('ادمن')),
                ],
                onChanged: (v) => setState(() => role = v!),
                decoration: const InputDecoration(labelText: 'الدور'),
              ),
              const SizedBox(height: 20),

              // Send verification code
              if (verificationId == null)
                ElevatedButton(
                  child: const Text('إرسال الرمز'),
                  onPressed: () async {
                    if (_phoneController.text.isEmpty) return;
                    await AuthService().signInWithPhone(
                      _phoneController.text,
                      (id) => setState(() => verificationId = id),
                    );
                  },
                )
              else ...[
                TextField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'رمز التحقق',
                  ),
                ),
                const SizedBox(height: 20),

                // Confirm code
                ElevatedButton(
                  child: const Text('تأكيد'),
                  onPressed: () async {
                    if (_codeController.text.isEmpty) return;
                    await AuthService().verifyCode(
                      verificationId!,
                      _codeController.text,
                      role,
                    );
                  },
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
