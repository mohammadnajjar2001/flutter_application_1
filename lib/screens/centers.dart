import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_widgets.dart';

class CentersScreen extends StatelessWidget {
  const CentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final centers = [
      ('المركز الرئيسي', 'دمشق - ساحة الخدمات الحكومية', '08:30 - 14:30'),
      ('مركز المنطقة الشمالية', 'حلب - مبنى شؤون العاملين', '09:00 - 14:00'),
      ('مركز المنطقة الساحلية', 'اللاذقية - مجمع الخدمات', '09:00 - 14:00'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('مراكز الانتساب')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const GovernmentHeader(
            title: 'مراكز الخدمة',
            subtitle: 'مواقع استلام الوثائق ومتابعة إجراءات الانتساب والتوظيف.',
            icon: Icons.location_city_outlined,
          ),
          const SizedBox(height: 20),
          ...centers.map(
            (center) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      center.$1,
                      style: const TextStyle(
                        color: AppColors.deepGreen,
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _line(Icons.place_outlined, center.$2),
                    const SizedBox(height: 8),
                    _line(Icons.schedule_outlined, center.$3),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _line(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.heritageGold),
        const SizedBox(width: 8),
        Expanded(
          child: Text(text, style: const TextStyle(color: AppColors.muted)),
        ),
      ],
    );
  }
}
