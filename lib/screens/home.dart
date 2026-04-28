import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_widgets.dart';
import 'centers.dart';
import 'contact.dart';
import 'faq.dart';
import 'job_form.dart';
import 'login.dart';
import 'news.dart';
import 'requirements.dart';
import 'tracking.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const HomeScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(title: const Text('الرئيسية')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GovernmentHeader(
            title: 'مرحبًا، $name',
            subtitle:
                'تابع طلباتك وخدمات الانتساب والتوظيف من لوحة واحدة مصممة للإنجاز السريع.',
            icon: Icons.account_balance_outlined,
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(child: _stat('طلباتي', '1', Icons.assignment_outlined)),
              const SizedBox(width: 10),
              Expanded(child: _stat('قيد المراجعة', '1', Icons.pending_actions)),
            ],
          ),
          const SizedBox(height: 22),
          const AppSectionTitle(title: 'الخدمات'),
          const SizedBox(height: 12),
          QuickActionCard(
            icon: Icons.work_outline,
            title: 'تقديم طلب توظيف',
            subtitle: 'إدخال البيانات الشخصية والمؤهلات والخبرات',
            onTap: () => _open(context, JobFormScreen()),
          ),
          const SizedBox(height: 12),
          QuickActionCard(
            icon: Icons.track_changes_outlined,
            title: 'متابعة حالة الطلب',
            subtitle: 'عرض مرحلة التدقيق والقبول وموعد المقابلة',
            onTap: () => _open(context, TrackingScreen()),
          ),
          const SizedBox(height: 12),
          QuickActionCard(
            icon: Icons.fact_check_outlined,
            title: 'الشروط والوثائق',
            subtitle: 'قائمة المتطلبات الأساسية قبل إرسال الطلب',
            onTap: () => _open(context, const RequirementsScreen()),
          ),
          const SizedBox(height: 22),
          const AppSectionTitle(title: 'معلومات الحساب'),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              children: [
                _profileLine(Icons.email_outlined, 'البريد الإلكتروني', email),
                const Divider(height: 24),
                _profileLine(Icons.phone_outlined, 'رقم الهاتف', phone),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String title, String value, IconData icon) {
    return AppCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.heritageGold),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.deepGreen,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(title, style: const TextStyle(color: AppColors.muted)),
        ],
      ),
    );
  }

  Widget _profileLine(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: AppColors.heritageGold),
        const SizedBox(width: 10),
        Expanded(
          child: Text(title, style: const TextStyle(color: AppColors.muted)),
        ),
        Flexible(
          child: Text(
            value.isEmpty ? 'غير محدد' : value,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: AppColors.ink,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.deepGreen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.person,
                      size: 34, color: AppColors.deepGreen),
                ),
                const SizedBox(height: 12),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(email, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          _drawerItem(context, Icons.home_outlined, 'الرئيسية',
              () => Navigator.pop(context)),
          _drawerItem(context, Icons.campaign_outlined, 'الأخبار',
              () => _replaceDrawer(context, const NewsScreen())),
          _drawerItem(context, Icons.work_outline, 'طلب توظيف',
              () => _replaceDrawer(context, JobFormScreen())),
          _drawerItem(context, Icons.track_changes_outlined, 'متابعة الطلب',
              () => _replaceDrawer(context, TrackingScreen())),
          _drawerItem(context, Icons.fact_check_outlined, 'الشروط والوثائق',
              () => _replaceDrawer(context, const RequirementsScreen())),
          _drawerItem(context, Icons.location_city_outlined, 'مراكز الانتساب',
              () => _replaceDrawer(context, const CentersScreen())),
          _drawerItem(context, Icons.help_outline, 'الأسئلة الشائعة',
              () => _replaceDrawer(context, const FaqScreen())),
          _drawerItem(context, Icons.support_agent_outlined, 'التواصل والدعم',
              () => _replaceDrawer(context, ContactScreen())),
          const Divider(),
          _drawerItem(
            context,
            Icons.logout,
            'تسجيل الخروج',
            () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
            color: Colors.red.shade700,
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String text,
    VoidCallback onTap, {
    Color color = AppColors.deepGreen,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.w800),
      ),
      onTap: onTap,
    );
  }

  void _open(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  void _replaceDrawer(BuildContext context, Widget screen) {
    Navigator.pop(context);
    _open(context, screen);
  }
}
