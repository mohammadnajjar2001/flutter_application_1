import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../widgets/app_widgets.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({super.key});

  final TextEditingController subject = TextEditingController();
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('التواصل والدعم')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const GovernmentHeader(
            title: 'مركز المساعدة',
            subtitle: 'أرسل استفسارك أو راجع بيانات التواصل الرسمية للفرع.',
            icon: Icons.support_agent_outlined,
          ),
          const SizedBox(height: 18),
          const AppCard(
            child: Column(
              children: [
                _ContactLine(Icons.phone_outlined, '011-0000000'),
                SizedBox(height: 12),
                _ContactLine(Icons.email_outlined, 'jobs@gov.example'),
                SizedBox(height: 12),
                _ContactLine(Icons.schedule_outlined, 'الأحد - الخميس، 8:30 - 14:30'),
              ],
            ),
          ),
          const SizedBox(height: 18),
          AppTextField(
            label: 'موضوع الرسالة',
            controller: subject,
            icon: Icons.title,
          ),
          const SizedBox(height: 12),
          AppTextField(
            label: 'نص الرسالة',
            controller: message,
            icon: Icons.notes_outlined,
            maxLines: 4,
          ),
          const SizedBox(height: 18),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم إرسال الرسالة تجريبيًا')),
              );
            },
            icon: const Icon(Icons.send_outlined),
            label: const Text('إرسال'),
          ),
        ],
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactLine(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.heritageGold),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.ink,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
