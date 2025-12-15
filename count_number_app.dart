import 'package:flutter/material.dart';

class CountNumber extends StatefulWidget {
  const CountNumber({super.key});

  @override
  State<CountNumber> createState() => _CountNumberState();
}

class _CountNumberState extends State<CountNumber> {
  int num = 0;
  @override
  void countNumber() {
    setState(() {
      num = num + 1;
    });
  }

  void prevNumber() {
    setState(() {
      num = num - 1;
    });
  }

  void resetNumber() {
    setState(() {
      num = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Ứng dụng đếm số",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ứng dụng đếm số"),
          backgroundColor: Color.fromARGB(255, 31, 91, 255),
          centerTitle: true,
        ),
        body: Container(
          color: Color.fromARGB(255, 240, 240, 240),
          child: myBody(),
        ),
      ),
    );
  }

  Widget myBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Giá trị hiện tại',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 22, 22, 22),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            ' $num',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 54, 54, 54),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: prevNumber,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 12, 12),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text(
                  "- Giảm",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              ElevatedButton(
                onPressed: resetNumber,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 132, 132, 132),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text(
                  "Đặt lại",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              ElevatedButton(
                onPressed: countNumber,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 5, 172, 80),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text(
                  "+ Tăng",
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
