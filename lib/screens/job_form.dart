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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF12433B)),
        title: Text(
          "طلب توظيف",
          style: TextStyle(
            color: Color(0xFF12433B),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle("المعلومات الشخصية"),

            _inputField("الاسم الكامل", name, Icons.person_outline),
            SizedBox(height: 15),
            _inputField("رقم الهوية", id, Icons.badge_outlined),
            SizedBox(height: 15),
            _inputField("رقم الهاتف", phone, Icons.phone_outlined),
            SizedBox(height: 15),
            _inputField("تاريخ الميلاد", birth, Icons.calendar_month_outlined),
            SizedBox(height: 15),
            _inputField("العنوان", address, Icons.location_on_outlined),

            SizedBox(height: 30),
            _sectionTitle("المؤهلات"),

            _inputField("المؤهل العلمي", degree, Icons.school_outlined),
            SizedBox(height: 15),
            _inputField("الخبرات السابقة", experience, Icons.work_outline),
            SizedBox(height: 15),
            _inputField("المهارات", skills, Icons.star_border),

            SizedBox(height: 30),
            _sectionTitle("السيرة الذاتية"),

            _uploadButton(),

            SizedBox(height: 40),

            _mainButton(
              text: "إرسال الطلب",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("تم إرسال الطلب بنجاح"),
                    backgroundColor: Color(0xFF12433B),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xFF12433B),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _inputField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF988561), width: 1.5),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black87),
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
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF988561), width: 2),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(Icons.upload_file, color: Color(0xFF988561)),
        label: Text(
          "رفع السيرة الذاتية (PDF)",
          style: TextStyle(
            color: Color(0xFF988561),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _mainButton({required String text, required VoidCallback onTap}) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: Color(0xFF12433B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
