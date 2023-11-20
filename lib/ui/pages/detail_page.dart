import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:mangatale/model/comic.dart';
import 'package:mangatale/shared/theme.dart';
import 'package:mangatale/ui/pages/dashboard_page.dart';
import 'package:mangatale/ui/widgets/rating_widget.dart';

class DetailKey {
  String title;
  String key;

  DetailKey({required this.title, required this.key});
}

class DetailScreen extends StatelessWidget {
  final Comic comic;

  const DetailScreen({Key? key, required this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DetailKey> keyOfDetail = [
      DetailKey(title: 'Sinopsis', key: 'sinopsis'),
      DetailKey(title: 'Released', key: 'yearReleased'),
      DetailKey(title: 'Author', key: 'author')
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: mPrimaryColor,
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
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
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: BreadCrumb(
                      items: <BreadCrumbItem>[
                        BreadCrumbItem(
                            content: InkWell(
                          child: Text('MangaTale'),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        )),
                        BreadCrumbItem(
                            content: Text(
                          comic.judul,
                          style: TextStyle(color: mSecondaryColor),
                        ))
                      ],
                      divider: Icon(Icons.chevron_right),
                    ),
                  ),
                ),
                Card(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          width: 110,
                          child: ClipRRect(
                            child: Image.network(
                              comic.poster,
                              width: 110,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        comic.judul,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.0),
                        height: 32,
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: mGrayColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBintangWidget(rating: comic.rate / 2),
                            Text(comic.rate.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                              height: 32,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: mGrayColor),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Status',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                  Expanded(
                                      child: Text(
                                    comic.status,
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            )),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Container(
                              height: 32,
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: mGrayColor),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text('Type',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  Expanded(
                                      child: Text(
                                    comic.tipe,
                                    textAlign: TextAlign.center,
                                  ))
                                ],
                              ),
                            )),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          ...keyOfDetail.map((detail) {
                            String keyToAccess = detail.key;
                            return Container(
                              margin: EdgeInsets.only(top: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    detail.title,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    comic.getValue(keyToAccess).toString(),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                          Container(
                            margin: EdgeInsets.only(top: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Genre',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children: comic.genres.map((genre) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4.0),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(4.0)),
                                      child: Text(genre),
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          )),
        ));
  }
}
