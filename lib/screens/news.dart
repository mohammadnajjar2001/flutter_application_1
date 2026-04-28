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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF12433B)),
        title: Text(
          "الأخبار",
          style: TextStyle(
            color: Color(0xFF12433B),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFF988561), width: 1.5),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(Icons.newspaper, color: Color(0xFF988561), size: 32),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news[index]["title"]!,
                        style: TextStyle(
                          color: Color(0xFF12433B),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        news[index]["desc"]!,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
