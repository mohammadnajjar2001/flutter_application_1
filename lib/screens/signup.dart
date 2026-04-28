import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_widgets.dart';
import 'home.dart';
import 'login.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
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
              title: 'إنشاء حساب جديد',
              subtitle: 'سجل بياناتك الأساسية للبدء بتقديم الطلبات ومتابعتها.',
              icon: Icons.person_add_alt_1,
            ),
            const SizedBox(height: 22),
            AppTextField(
              label: 'الاسم الكامل',
              controller: name,
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 14),
            AppTextField(
              label: 'البريد الإلكتروني',
              controller: email,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 14),
            AppTextField(
              label: 'رقم الهاتف',
              controller: phone,
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
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
                      name: name.text.isEmpty ? 'مستخدم جديد' : name.text,
                      email: email.text,
                      phone: phone.text,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.verified_user_outlined),
              label: const Text('إنشاء الحساب'),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('لديك حساب بالفعل؟',
                    style: TextStyle(color: AppColors.muted)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  },
                  child: const Text('تسجيل الدخول'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
