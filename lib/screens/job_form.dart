import 'package:flutter/material.dart';

class JobFormScreen extends StatelessWidget {
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
      appBar: AppBar(
        backgroundColor: Color(0xFF12433B),
        title: Text("طلب توظيف", style: TextStyle(color: Color(0xFF988561))),
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
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle("المعلومات الشخصية"),

                _input("الاسم الكامل", name, Icons.person),
                SizedBox(height: 15),
                _input("رقم الهوية", id, Icons.badge),
                SizedBox(height: 15),
                _input("رقم الهاتف", phone, Icons.phone),
                SizedBox(height: 15),
                _input("تاريخ الميلاد", birth, Icons.calendar_month),
                SizedBox(height: 15),
                _input("العنوان", address, Icons.location_on),

                SizedBox(height: 25),
                _sectionTitle("المؤهلات"),

                _input("المؤهل العلمي", degree, Icons.school),
                SizedBox(height: 15),
                _input("الخبرات السابقة", experience, Icons.work),
                SizedBox(height: 15),
                _input("المهارات", skills, Icons.star),

                SizedBox(height: 25),
                _sectionTitle("السيرة الذاتية"),

                _uploadButton(),

                SizedBox(height: 35),

                _goldButton(
                  text: "إرسال الطلب",
                  onPressed: () {
                    // لاحقًا نضيف إرسال البيانات
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF988561),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _input(String label, TextEditingController controller, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF988561)),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xFF988561)),
          labelText: label,
          labelStyle: TextStyle(color: Color(0xFF988561)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
      ),
    );
  }

  Widget _uploadButton() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF988561), width: 2),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(Icons.upload_file, color: Color(0xFF988561)),
        label: Text(
          "رفع السيرة الذاتية (PDF)",
          style: TextStyle(color: Color(0xFF988561), fontSize: 16),
        ),
      ),
    );
  }

  Widget _goldButton({required String text, required VoidCallback onPressed}) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF988561), Color(0xFF7A6A4F)],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
