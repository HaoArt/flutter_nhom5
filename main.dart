import 'package:flutter/material.dart';
import 'package:flutter_application_1/change_color_app.dart';
import 'package:flutter_application_1/count_number_app.dart';
import 'package:flutter_application_1/demoapp.dart';
import 'package:flutter_application_1/example.dart';
import 'package:flutter_application_1/flutter_nhom_5.dart';
import 'package:flutter_application_1/sahara.dart';
import 'package:flutter_application_1/hello.dart';
import 'package:flutter_application_1/login_app.dart';
import 'package:flutter_application_1/login_token.dart';
import 'package:flutter_application_1/my_classroom.dart';
import 'package:flutter_application_1/my_products.dart';
import 'package:flutter_application_1/register_app.dart';
import 'package:flutter_application_1/screen/list_article.dart';
import 'package:flutter_application_1/timer_app.dart';
import 'package:flutter_application_1/travale.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(home: HomeScreen());
    // return const MaterialApp(home: MyLap());
    // return const MaterialApp(home: MyHome());
    // return const MaterialApp(home: DemoApp());
    // return const MaterialApp(home: MyClassroom());
    // return const MaterialApp(home: MyTravel());
    // return const MaterialApp(home: ChangeColor());
    // return const MaterialApp(home: CountNumber());
    // return const MaterialApp(home: TimerApp());
    // return const MaterialApp(home: LoginApp());
    // return const MaterialApp(home: RegisterApp());
    // return const MaterialApp(home: MyProducts());
    // return MaterialApp(title: "News App", home: ArticlePage());
    // return const MaterialApp(home: LoginToken());
    return MaterialApp(title: "Bài Kiểm Tra", home: ExamplePage());
  }
}
