import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_widgets.dart';
import 'home.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const GovernmentHeader(
              title: 'تسجيل الدخول',
              subtitle: 'أدخل بيانات الحساب للوصول إلى خدمات الانتساب والتوظيف.',
              icon: Icons.lock_open_outlined,
            ),
            const SizedBox(height: 22),
            AppTextField(
              label: 'البريد الإلكتروني',
              controller: email,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 14),
            AppTextField(
              label: 'كلمة المرور',
              controller: password,
              icon: Icons.lock_outline,
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(
                      name: 'مستخدم تجريبي',
                      email: email.text,
                      phone: '0590000000',
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.login),
              label: const Text('دخول'),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('ليس لديك حساب؟',
                    style: TextStyle(color: AppColors.muted)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignupScreen()),
                    );
                  },
                  child: const Text('إنشاء حساب'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
