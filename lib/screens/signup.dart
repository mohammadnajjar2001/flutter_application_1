import 'package:flutter/material.dart';
import 'login.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                Text(
                  "إنشاء حساب",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF12433B),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "أدخل بياناتك لإنشاء حساب جديد",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),

                const SizedBox(height: 40),

                _inputField(
                  label: "الاسم الكامل",
                  controller: name,
                  icon: Icons.person_outline,
                ),

                const SizedBox(height: 20),

                _inputField(
                  label: "البريد الإلكتروني",
                  controller: email,
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 20),

                _inputField(
                  label: "رقم الهاتف",
                  controller: phone,
                  icon: Icons.phone_outlined,
                ),

                const SizedBox(height: 20),

                _inputField(
                  label: "كلمة المرور",
                  controller: password,
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),

                const SizedBox(height: 30),

                _mainButton(
                  text: "إنشاء الحساب",
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("تم إنشاء الحساب بنجاح"),
                        backgroundColor: Color(0xFF12433B),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "لديك حساب بالفعل",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          color: Color(0xFF988561),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF988561), width: 1.5),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
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
