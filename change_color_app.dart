import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColor extends StatefulWidget {
  const ChangeColor({super.key});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  Color bgColor = Colors.grey; // màu nền ban đầu

  final List<Color> colors = [
    Colors.pink,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
  ];

  final Random random = Random();

  void changeBackgroundColor() {
    setState(() {
      bgColor = colors[random.nextInt(colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Change Color",
      color: Colors.blue,
      child: Scaffold(
        backgroundColor: bgColor, // ✅ QUAN TRỌNG: gán màu nền
        appBar: AppBar(title: const Text("Change Color"), centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nhấn nút bên dưới để đổi màu nền',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: changeBackgroundColor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Đổi màu"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
