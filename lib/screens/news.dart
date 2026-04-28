import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final List<Map<String, String>> news = [
    {
      "title": "فتح باب التوظيف",
      "desc": "تم فتح باب التقديم لوظائف جديدة في مختلف الأقسام.",
    },
    {
      "title": "إعلان هام",
      "desc": "تحديثات جديدة في نظام الانتساب للعام الحالي.",
    },
    {"title": "فرص تدريب", "desc": "إطلاق برنامج تدريب للخريجين الجدد."},
    {
      "title": "تطوير الأنظمة",
      "desc": "تحديث النظام الإلكتروني لتسهيل عملية التقديم.",
    },
    {"title": "وظائف مؤقتة", "desc": "فرص عمل مؤقتة متاحة لمدة 3 أشهر."},
    {
      "title": "مقابلات شخصية",
      "desc": "بدء المقابلات الشخصية للمتقدمين للوظائف الإدارية.",
    },
    {
      "title": "إعلان نتائج",
      "desc": "إعلان نتائج المقبولين في المرحلة الأولى.",
    },
    {"title": "دورات مجانية", "desc": "توفير دورات تدريبية مجانية للمتقدمين."},
    {"title": "فرع جديد", "desc": "افتتاح فرع جديد لخدمة المنتسبين."},
    {
      "title": "تحديث بيانات",
      "desc": "دعوة المنتسبين لتحديث بياناتهم عبر التطبيق.",
    },
    {
      "title": "إجازات رسمية",
      "desc": "تنويه بخصوص مواعيد العمل خلال الإجازات الرسمية.",
    },
    {"title": "مبادرة جديدة", "desc": "إطلاق مبادرة لدعم الباحثين عن عمل."},
    {
      "title": "تحسين الخدمات",
      "desc": "تحسين سرعة معالجة الطلبات الإلكترونية.",
    },
    {"title": "ورش عمل", "desc": "تنظيم ورش عمل حول كتابة السيرة الذاتية."},
    {
      "title": "تنويه مهم",
      "desc": "يرجى متابعة البريد الإلكتروني لمعرفة حالة الطلب.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF12433B),
        title: Text("الأخبار", style: TextStyle(color: Color(0xFF988561))),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF12433B), Color(0xFF0E2E29)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFF988561), width: 1.5),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.newspaper,
                  color: Color(0xFF988561),
                  size: 30,
                ),
                title: Text(
                  news[index]["title"]!,
                  style: TextStyle(
                    color: Color(0xFF988561),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  news[index]["desc"]!,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
