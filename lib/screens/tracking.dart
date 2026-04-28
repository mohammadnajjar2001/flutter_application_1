import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_widgets.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  String status = 'pending';
  String reason = '';
  String interviewDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('متابعة الطلب')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GovernmentHeader(
            title: _getTitle(),
            subtitle: _getDescription(),
            icon: _getIcon(),
          ),
          const SizedBox(height: 20),
          AppCard(
            child: Column(
              children: [
                _step('استلام الطلب', true),
                _step('تدقيق البيانات', status != 'rejected'),
                _step('تحديد المقابلة', status == 'accepted'),
                _step('النتيجة النهائية', status == 'accepted' || status == 'rejected'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const AppSectionTitle(title: 'تغيير الحالة للتجربة'),
          const SizedBox(height: 12),
          _statusButton('قيد المراجعة', 'pending'),
          const SizedBox(height: 10),
          _statusButton('قبول وتحديد موعد', 'accepted'),
          const SizedBox(height: 10),
          _statusButton('رفض الطلب', 'rejected'),
        ],
      ),
    );
  }

  Widget _step(String title, bool active) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            active ? Icons.check_circle : Icons.radio_button_unchecked,
            color: active ? AppColors.heritageGold : AppColors.border,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: active ? AppColors.ink : AppColors.muted,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusButton(String text, String newStatus) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          status = newStatus;
          if (newStatus == 'accepted') {
            interviewDate = 'الأحد 12 أيار - الساعة 10:00 صباحًا';
          }
          if (newStatus == 'rejected') {
            reason = 'لا تتوافق البيانات الحالية مع شروط الشاغر المعلن.';
          }
        });
      },
      child: Text(text),
    );
  }

  IconData _getIcon() {
    if (status == 'pending') return Icons.pending_actions;
    if (status == 'accepted') return Icons.verified_outlined;
    return Icons.cancel_outlined;
  }

  String _getTitle() {
    if (status == 'pending') return 'الطلب قيد المراجعة';
    if (status == 'accepted') return 'تم قبول الطلب مبدئيًا';
    return 'لم يتم قبول الطلب';
  }

  String _getDescription() {
    if (status == 'pending') {
      return 'طلبك مسجل لدى الفرع ويتم تدقيق البيانات والوثائق المرفقة.';
    }
    if (status == 'accepted') {
      return 'يرجى مراجعة الفرع في موعد المقابلة: $interviewDate';
    }
    return 'سبب عدم القبول: $reason';
  }
}
