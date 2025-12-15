import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Hello",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Text("Home Screen"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "Xin chào, Tôi là Hoàng Nhật Hào!",
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
