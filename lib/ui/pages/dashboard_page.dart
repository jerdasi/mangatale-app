import 'package:flutter/material.dart';
import 'package:mangatale/model/comic.dart';
import 'package:mangatale/shared/theme.dart';
import 'package:mangatale/ui/widgets/rating_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Popular Today',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection:
                    Axis.horizontal, // Mengatur arah scroll menjadi horizontal
                itemCount: comicList.length,
                itemBuilder: (context, index) {
                  final Comic comic = comicList[index];
                  return Container(
                      height: 150,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              flex: 3,
                              child: ClipRRect(
                                child: Image.network(
                                  comic.poster,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                          Expanded(child: Text(comic.judul)),
                          RatingBintangWidget(rating: comic.rate / 2)
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
