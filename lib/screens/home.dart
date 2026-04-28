import 'package:flutter/material.dart';
import 'news.dart';
import 'job_form.dart';
import 'login.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  HomeScreen({required this.name, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: _buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF12433B)),
        title: Text(
          "الصفحة الرئيسية",
          style: TextStyle(
            color: Color(0xFF12433B),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // صورة الحساب
            CircleAvatar(
              radius: 45,
              backgroundColor: Color(0xFF12433B),
              child: Icon(Icons.person, size: 55, color: Colors.white),
            ),

            const SizedBox(height: 20),

            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF12433B),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              email,
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),

            const SizedBox(height: 30),

            _infoTile("رقم الهاتف", phone),
            const SizedBox(height: 15),
            _infoTile("البريد الإلكتروني", email),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF988561), width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF988561),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Color(0xFF12433B),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF12433B)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 45, color: Color(0xFF12433B)),
                ),
                const SizedBox(height: 10),
                Text(name, style: TextStyle(color: Colors.white, fontSize: 20)),
                Text(
                  email,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          _drawerItem(
            icon: Icons.home,
            text: "الصفحة الرئيسية",
            onTap: () => Navigator.pop(context),
          ),

          _drawerItem(
            icon: Icons.newspaper,
            text: "الأخبار",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NewsScreen()),
              );
            },
          ),

          _drawerItem(
            icon: Icons.work_outline,
            text: "طلب توظيف",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobFormScreen()),
              );
            },
          ),

          Divider(),

          _drawerItem(
            icon: Icons.logout,
            text: "تسجيل الخروج",
            color: Colors.red,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color color = const Color(0xFF12433B),
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    );
  }
}
