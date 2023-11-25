import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mangatale/ui/pages/dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => DashboardPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 80,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo-mangatale.png'))),
          ),
          Text(
            'Tempat Baca Komik Yang Garapnya Cepat',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      )),
    ));
  }
}
