import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_widgets.dart';
import 'tracking.dart';

class JobFormScreen extends StatelessWidget {
  JobFormScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController degree = TextEditingController();
  final TextEditingController birth = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController experience = TextEditingController();
  final TextEditingController skills = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلب توظيف')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const GovernmentHeader(
            title: 'نموذج طلب التوظيف',
            subtitle:
                'أدخل بياناتك بدقة. هذه الواجهة تجريبية حاليًا ولا ترسل البيانات إلى خادم.',
            icon: Icons.assignment_add,
          ),
          const SizedBox(height: 22),
          const AppSectionTitle(title: 'المعلومات الشخصية'),
          const SizedBox(height: 12),
          AppTextField(
            label: 'الاسم الكامل',
            controller: name,
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'رقم الهوية',
            controller: id,
            icon: Icons.badge_outlined,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'رقم الهاتف',
            controller: phone,
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'تاريخ الميلاد',
            controller: birth,
            icon: Icons.calendar_month_outlined,
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'العنوان',
            controller: address,
            icon: Icons.location_on_outlined,
          ),
          const SizedBox(height: 24),
          const AppSectionTitle(title: 'المؤهلات والخبرات'),
          const SizedBox(height: 12),
          AppTextField(
            label: 'المؤهل العلمي',
            controller: degree,
            icon: Icons.school_outlined,
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'الخبرات السابقة',
            controller: experience,
            icon: Icons.work_outline,
            maxLines: 3,
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'المهارات',
            controller: skills,
            icon: Icons.star_border,
            maxLines: 2,
          ),
          const SizedBox(height: 24),
          const AppSectionTitle(title: 'المرفقات'),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.upload_file),
            label: const Text('رفع السيرة الذاتية PDF'),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TrackingScreen()),
              );
            },
            icon: const Icon(Icons.send_outlined),
            label: const Text('إرسال الطلب'),
          ),
          const SizedBox(height: 12),
          const Text(
            'سيتم توليد رقم طلب تجريبي بعد الربط الخلفي لاحقًا.',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.muted),
          ),
        ],
      ),
    );
  }
}
