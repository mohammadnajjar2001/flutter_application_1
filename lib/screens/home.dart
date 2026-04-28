import 'package:flutter/material.dart';
import 'news.dart';
import 'job_form.dart';
import 'login.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  HomeScreen({
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Color(0xFF12433B),
        title: Text("الصفحة الرئيسية", style: TextStyle(color: Color(0xFF988561))),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF12433B),
              Color(0xFF0E2E29),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF988561),
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),

              SizedBox(height: 20),

              Text(
                name,
                style: TextStyle(
                  color: Color(0xFF988561),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              _infoTile("البريد الإلكتروني", email),
              _infoTile("رقم الهاتف", phone),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFF988561)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Color(0xFF988561), fontSize: 16)),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF0E2E29),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF12433B),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Color(0xFF988561),
                  child: Icon(Icons.person, size: 45, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  name,
                  style: TextStyle(color: Color(0xFF988561), fontSize: 20),
                ),
                Text(
                  email,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.home, color: Color(0xFF988561)),
            title: Text("الصفحة الرئيسية", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.newspaper, color: Color(0xFF988561)),
            title: Text("الأخبار", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => NewsScreen()));
            },
          ),

          ListTile(
            leading: Icon(Icons.work, color: Color(0xFF988561)),
            title: Text("تقديم طلب توظيف", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => JobFormScreen()));
            },
          ),

          Divider(color: Color(0xFF988561)),

          ListTile(
            leading: Icon(Icons.logout, color: Colors.redAccent),
            title: Text("تسجيل الخروج", style: TextStyle(color: Colors.redAccent)),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
