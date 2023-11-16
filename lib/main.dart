import 'package:flutter/material.dart';
import 'package:mangatale/ui/pages/dashboard_page.dart';
import 'package:mangatale/ui/pages/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Fira Sans'),
      home: DashboardPage(),
    );
  }
}
