import 'package:flutter/material.dart';
import 'package:mangatale/shared/theme.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mPrimaryColor,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Container(
          height: kToolbarHeight,
          child: Image.asset(
            'assets/logo-mangatale.png',
            width: 96,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text('Popular Today'),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection:
                    Axis.horizontal, // Mengatur arah scroll menjadi horizontal
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200.0, // Lebar setiap item dalam carousel
                    margin: EdgeInsets.all(8.0),
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        items[index],
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
