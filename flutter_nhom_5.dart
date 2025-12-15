import 'package:flutter/material.dart';

class MyLap extends StatelessWidget {
  const MyLap({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "AxisAlignment",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Text("AxisAlignment"),
          centerTitle: true,
        ),
        body: myBody(),
      ),
    );
  }

  Widget myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Hello World',
                  style: TextStyle(color: Colors.red, fontSize: 40),
                ),
                Icon(Icons.heart_broken, color: Colors.pink, size: 150),
                Text(
                  "Chúng tôi là lớp LTDĐ - Nhóm 5",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
