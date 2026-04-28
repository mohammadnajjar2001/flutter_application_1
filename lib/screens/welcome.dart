import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_widgets.dart';
import 'login.dart';
import 'news.dart';
import 'signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.deepGreen,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.heritageGold),
                    ),
                    child: Image.asset('assets/images/1.png'),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'فرع الانتساب والتوظيف',
                          style: TextStyle(
                            color: AppColors.deepGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'بوابة الخدمات الإلكترونية',
                          style: TextStyle(color: AppColors.muted),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const GovernmentHeader(
                title: 'خدمات الانتساب والتوظيف في مكان واحد',
                subtitle:
                    'تقديم الطلبات، متابعة الحالة، الاطلاع على الشروط، ومعرفة الإعلانات الرسمية من خلال واجهة موحدة وواضحة.',
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                },
                icon: const Icon(Icons.login),
                label: const Text('تسجيل الدخول'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignupScreen()),
                  );
                },
                icon: const Icon(Icons.person_add_alt_1),
                label: const Text('إنشاء حساب جديد'),
              ),
              const SizedBox(height: 20),
              QuickActionCard(
                icon: Icons.campaign_outlined,
                title: 'الإعلانات الرسمية',
                subtitle: 'آخر أخبار التوظيف ومواعيد الانتساب',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NewsScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),
              const AppCard(
                child: Row(
                  children: [
                    Icon(Icons.verified_user_outlined,
                        color: AppColors.heritageGold),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'هذه نسخة واجهة أمامية تجريبية ولا ترتبط حاليًا بخدمات خلفية.',
                        style: TextStyle(color: AppColors.muted, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
