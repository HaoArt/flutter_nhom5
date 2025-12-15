import 'package:flutter/material.dart';
import 'package:flutter_application_1/api.dart';
import 'package:flutter_application_1/login_app.dart';
import 'package:flutter_application_1/model/user.dart';

class Profile extends StatelessWidget {
  final UserModel user;

  const Profile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Thông tin cá nhân",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(title: const Text("Thông tin cá nhân")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ảnh đại diện
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(user.image),
                ),
              ),
              const SizedBox(height: 20),

              infoItem("ID", user.id.toString()),
              infoItem("Họ tên", "${user.firstName} ${user.lastName}"),
              infoItem("Tên thời thiếu nữ", user.maidenName),
              infoItem("Tuổi", user.age.toString()),
              infoItem("Giới tính", user.gender),
              infoItem("Email", user.email),
              infoItem("Số điện thoại", user.phone),
              infoItem("Username", user.username),
              infoItem("Ngày sinh", user.birthDate),

              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  test_api.logout(); // token = ""
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginApp()),
                    (route) => false,
                  );
                },

                child: const Text(
                  "Đăng xuất",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
