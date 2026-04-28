import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_widgets.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  final List<Map<String, String>> news = const [
    {
      'title': 'فتح باب التقديم',
      'desc': 'استقبال طلبات التوظيف للوظائف الإدارية والفنية ضمن المواعيد المحددة.',
      'tag': 'توظيف',
    },
    {
      'title': 'تحديث شروط الانتساب',
      'desc': 'اعتماد قائمة وثائق محدثة لتسهيل إجراءات التدقيق الأولي.',
      'tag': 'انتساب',
    },
    {
      'title': 'مواعيد المقابلات',
      'desc': 'سيتم نشر مواعيد المقابلات للطلبات المقبولة مبدئيًا عبر التطبيق.',
      'tag': 'إعلان',
    },
    {
      'title': 'دعم المتقدمين',
      'desc': 'تخصيص نافذة مساعدة للإجابة على الاستفسارات المتعلقة بالتقديم.',
      'tag': 'خدمة',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأخبار والإعلانات')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const GovernmentHeader(
            title: 'الإعلانات الرسمية',
            subtitle: 'تابع آخر المستجدات الخاصة بالانتساب والتوظيف.',
            icon: Icons.campaign_outlined,
          ),
          const SizedBox(height: 20),
          ...news.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.heritageGold.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item['tag']!,
                            style: const TextStyle(
                              color: AppColors.deepGreen,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.article_outlined,
                            color: AppColors.heritageGold),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        color: AppColors.deepGreen,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      item['desc']!,
                      style: const TextStyle(
                        color: AppColors.muted,
                        height: 1.5,
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
