import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_widgets.dart';

class RequirementsScreen extends StatelessWidget {
  const RequirementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('الهوية الشخصية', 'صورة واضحة عن الهوية أو الوثيقة الرسمية المعتمدة.'),
      ('المؤهل العلمي', 'الشهادة أو المصدقة العلمية بحسب نوع الشاغر.'),
      ('السيرة الذاتية', 'ملف PDF يتضمن الخبرات والمهارات وبيانات التواصل.'),
      ('صور شخصية', 'صورة حديثة بخلفية واضحة عند الحاجة.'),
      ('وثائق إضافية', 'أي شهادات خبرة أو دورات داعمة للطلب.'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('الشروط والوثائق')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const GovernmentHeader(
            title: 'متطلبات التقديم',
            subtitle:
                'تأكد من تجهيز الوثائق الأساسية قبل البدء بإرسال طلب الانتساب أو التوظيف.',
            icon: Icons.fact_check_outlined,
          ),
          const SizedBox(height: 20),
          const AppSectionTitle(title: 'الوثائق المطلوبة'),
          const SizedBox(height: 12),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle_outline,
                        color: AppColors.heritageGold),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.$1,
                            style: const TextStyle(
                              color: AppColors.ink,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.$2,
                            style: const TextStyle(
                              color: AppColors.muted,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
