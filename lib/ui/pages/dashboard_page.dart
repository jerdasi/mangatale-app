import 'package:flutter/material.dart';
import 'package:mangatale/model/comic.dart';
import 'package:mangatale/shared/theme.dart';
import 'package:mangatale/ui/widgets/rating_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Comic> dataPopularComics = popularComics(comicList);

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
              height: 4,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection:
                    Axis.horizontal, // Mengatur arah scroll menjadi horizontal
                itemCount: dataPopularComics.length,
                itemBuilder: (context, index) {
                  final Comic comic = dataPopularComics[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Container(
                        height: 250,
                        width: 150,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      child: Image.network(
                                        comic.poster,
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 4.0,
                                      child: RawChip(
                                        backgroundColor: comic.tipe == 'Manhwa'
                                            ? mTipeManhwaColor
                                            : mTipeMangaColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              4.0), // Atur nilai sesuai dengan keinginan Anda
                                        ),
                                        padding: EdgeInsets.all(0.0),
                                        label: Text(
                                          comic.tipe,
                                          style: TextStyle(
                                            color: mWhiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 4),
                                    Text(
                                      comic.judul,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 4),
                                    RatingBintangWidget(rating: comic.rate / 2)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Project',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  style:
                      TextButton.styleFrom(textStyle: TextStyle(fontSize: 12)),
                  onPressed: () {},
                  child: const Text('Selengkapnya'),
                ),
              ],
            ),
            SizedBox(
              height: 450,
              child: ListView.builder(
                // scrollDirection:
                //     Axis.horizontal, // Mengatur arah scroll menjadi horizontal
                itemCount: comicList.length,
                itemBuilder: (context, index) {
                  final Comic comic = comicList[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        height: 100,
                        width: double.infinity,
                        child: Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                child: Image.network(
                                  comic.poster,
                                  fit: BoxFit.cover,
                                  width: 80,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              // SizedBox(
                              //   width: 4.0,
                              // ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.0, horizontal: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              comic.judul,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              comic.author,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: mSecondaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RatingBintangWidget(
                                          rating: comic.rate / 2)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                },
              ),
            )
          ],
        ),
      ))),
    );
  }
}

List<Comic> popularComics(List<Comic> comics) {
  // Gunakan fungsi where untuk menyaring item yang sesuai kondisi
  List<Comic> filteredComics =
      comics.where((comic) => comic.rate > 7.5).toList();
  return filteredComics;
}
