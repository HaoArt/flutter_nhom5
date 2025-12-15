import 'dart:async';

import 'package:flutter/material.dart';

class TimerApp extends StatefulWidget {
  const TimerApp({super.key});

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int second = 120;
  Timer? _timer;

  void startTimer() {
    if (_timer != null && _timer!.isActive) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (second > 0) {
          second--;
        } else {
          timer.cancel();
          _showAlert();
        }
      });
    });
  }

  void resetTimer() {
    _timer?.cancel();
    setState(() {
      second = 120;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Ứng dụng đếm giờ",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ứng dụng đếm giờ"),
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

  void _showAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("⏰ Hết giờ!"),
        content: const Text("Thời gian đã kết thúc."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // đóng alert
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  String formatTime(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int secs = duration.inSeconds.remainder(60);

    if (hours == 0) {
      return '${twoDigits(minutes)}:${twoDigits(secs)}';
    } else {
      return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(secs)}';
    }
  }

  Widget myBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Thời gian còn lại',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 22, 22, 22),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            formatTime(second),
            style: const TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 54, 54, 54),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: startTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 12, 12),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text(
                  "Bắt đầu",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: resetTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 172, 80),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text(
                  "Đặt lại",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
