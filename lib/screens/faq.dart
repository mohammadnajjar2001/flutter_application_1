import 'package:flutter/material.dart';
import '../app_theme.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questions = [
      ('هل يمكن تعديل الطلب بعد الإرسال؟',
          'نعم، يمكن تعديل البيانات قبل انتقال الطلب إلى مرحلة التدقيق.'),
      ('كيف أعرف نتيجة الطلب؟',
          'تظهر الحالة ضمن صفحة متابعة الطلب، ويمكن عرض موعد المقابلة عند القبول.'),
      ('هل التطبيق مرتبط بخدمات فعلية الآن؟',
          'حاليًا الواجهة أمامية فقط، ويمكن ربطها لاحقًا بقاعدة بيانات أو API.'),
      ('ما صيغة السيرة الذاتية المطلوبة؟', 'يفضل رفع السيرة الذاتية بصيغة PDF.'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('الأسئلة الشائعة')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: questions
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ExpansionTile(
                  backgroundColor: AppColors.surface,
                  collapsedBackgroundColor: AppColors.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: AppColors.border),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: AppColors.border),
                  ),
                  iconColor: AppColors.heritageGold,
                  collapsedIconColor: AppColors.heritageGold,
                  title: Text(
                    item.$1,
                    style: const TextStyle(
                      color: AppColors.deepGreen,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          item.$2,
                          style: const TextStyle(
                            color: AppColors.muted,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
