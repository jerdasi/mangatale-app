import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      )),
    ));
  }
}
