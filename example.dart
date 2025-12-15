import 'package:flutter/material.dart';
import 'package:flutter_application_1/change_color_app.dart';
import 'package:flutter_application_1/count_number_app.dart';
import 'package:flutter_application_1/demoapp.dart';
import 'package:flutter_application_1/flutter_nhom_5.dart';
import 'package:flutter_application_1/lap1.dart';
import 'package:flutter_application_1/lap2.dart';
import 'package:flutter_application_1/login_app.dart';
import 'package:flutter_application_1/login_token.dart';
import 'package:flutter_application_1/my_classroom.dart';
import 'package:flutter_application_1/my_products.dart';
import 'package:flutter_application_1/register_app.dart';
import 'package:flutter_application_1/screen/list_article.dart';
import 'package:flutter_application_1/timer_app.dart';
import 'package:flutter_application_1/travale.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});

  final List<Map<String, Widget Function()>> pages = [
    {'Hello': () => const HomeScreen()},
    {'AxisAlignment': () => const MyLap()},
    {'Sahara': () => const MyHome()},
    {'Picture Place': () => const DemoApp()},
    {'MyClassroom': () => const MyClassroom()},
    {'MyTravel': () => const MyTravel()},
    {'ChangeColor': () => const ChangeColor()},
    {'CountNumber': () => const CountNumber()},
    {'TimerApp': () => const TimerApp()},
    {'LoginApp': () => const LoginApp()},
    {'RegisterApp': () => const RegisterApp()},
    {'MyProducts': () => const MyProducts()},
    {'ArticlePage': () => ArticlePage()},
    {'LoginToken': () => const LoginToken()},
  ];

  @override
  Widget build(BuildContext context) {
    return Title(
      title: "Bài Kiểm Tra",
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title: const Text("Bài Kiểm tra"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  'Danh sách bài',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),

              for (int i = 0; i < pages.length; i++)
                ListTile(
                  leading: Text(
                    'Bài ${i + 1}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  title: Text(pages[i].keys.first),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => pages[i].values.first(),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
        body: const Center(child: Text('Chọn bài trong Drawer')),
      ),
    );
  }
}
