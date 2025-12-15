import 'dart:math';
import 'package:flutter/material.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom({super.key});

  Color getRandomColor() {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.indigo,
      Colors.redAccent,
      Colors.cyan,
    ];

    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "My Classroom",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Text("My Classroom"),
          centerTitle: true,
        ),
        body: myBody(),
      ),
    );
  }

  Widget myBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(5, (index) => item(index)),
    );
  }

  Widget item(int index) {
    final List<Map<String, String>> data = [
      {
        'title': 'XML và ứng dụng - Nhóm 1',
        'code': '2025-2026.1.TIN4583.001',
        'student': '58 học viên',
      },
      {
        'title': 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 6',
        'code': '2025-2026.1.TIN4403.006',
        'student': '55 học viên',
      },
      {
        'title': 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 5',
        'code': '2025-2026.1.TIN4403.005',
        'student': '52 học viên',
      },
      {
        'title': 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 4',
        'code': '2025-2026.1.TIN4403.004',
        'student': '50 học viên',
      },
      {
        'title': 'Lập trình ứng dụng cho các thiết bị di động - Nhóm 3',
        'code': '2025-2026.1.TIN4403.003',
        'student': '48 học viên',
      },
    ];

    final itemData = data[index];
    final bgColor = getRandomColor();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      padding: EdgeInsets.all(16),
      height: 120,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage('assets/classroom_bg.png'),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['title']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                itemData['code']!,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Text(
                itemData['student']!,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          const Icon(Icons.more_vert, color: Colors.white),
        ],
      ),
    );
  }
}
