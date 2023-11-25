import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:mangatale/model/comic.dart';
import 'package:mangatale/shared/theme.dart';
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

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 768) {
        return DetailScreenWebPage(
          keyOfDetail: keyOfDetail,
          comic: comic,
        );
      } else {
        return DetailScreenMobilePage(comic: comic, keyOfDetail: keyOfDetail);
      }
    });
  }
}

class DetailScreenMobilePage extends StatelessWidget {
  final List<DetailKey> keyOfDetail;
  final Comic comic;
  const DetailScreenMobilePage(
      {super.key, required this.comic, required this.keyOfDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: mWhiteColor,
            backgroundColor: mPrimaryColor,
            title: SizedBox(
              height: kToolbarHeight,
              child: Image.asset(
                'assets/logo-mangatale.png',
                width: 96,
              ),
            )),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BreadCrumb(
                      items: <BreadCrumbItem>[
                        BreadCrumbItem(
                            content: InkWell(
                          child: const Text('MangaTale'),
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
                      divider: const Icon(Icons.chevron_right),
                    ),
                  ),
                ),
                Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Container(
                              width: 110,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.asset(
                                  comic.poster,
                                  width: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            comic.judul,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8.0),
                            height: 32,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: mGrayColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBintangWidget(rating: comic.rate / 2),
                                Text(comic.rate.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Container(
                                  height: 32,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: mGrayColor),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      const Expanded(
                                          child: Text(
                                        'Status',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      Expanded(
                                          child: Text(
                                        comic.status,
                                        textAlign: TextAlign.center,
                                      ))
                                    ],
                                  ),
                                )),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    child: Container(
                                  height: 32,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: mGrayColor),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      const Expanded(
                                          child: Text('Type',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
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
                                  margin: const EdgeInsets.only(top: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        detail.title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      'Genre',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Wrap(
                                      spacing: 4,
                                      runSpacing: 4,
                                      children: comic.genres.map((genre) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
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

class DetailScreenWebPage extends StatelessWidget {
  final List<DetailKey> keyOfDetail;
  final Comic comic;
  const DetailScreenWebPage(
      {super.key, required this.comic, required this.keyOfDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mPrimaryColor,
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: kToolbarHeight,
          child: Image.asset(
            'assets/logo-mangatale.png',
            width: 96,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 768,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BreadCrumb(
                        items: <BreadCrumbItem>[
                          BreadCrumbItem(
                              content: InkWell(
                            child: const Text('MangaTale'),
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
                        divider: const Icon(Icons.chevron_right),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.5),
                                      BlendMode.dstATop),
                                  image: AssetImage(comic.poster))),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 180,
                              padding: const EdgeInsets.all(16.0),
                              transform:
                                  Matrix4.translationValues(0.0, -50.0, 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: 110,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.0),
                                      child: Image.asset(
                                        comic.poster,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 8.0),
                                    height: 32,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: mGrayColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingBintangWidget(
                                            rating: comic.rate / 2),
                                        Text(comic.rate.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 8.0),
                                    height: 32,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: mGrayColor),
                                    child: Row(
                                      children: [
                                        const Expanded(
                                            child: Text(
                                          'Status',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        Expanded(
                                            child: Text(
                                          comic.status,
                                          textAlign: TextAlign.right,
                                        ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 8.0),
                                    height: 32,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: mGrayColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Expanded(
                                            child: Text(
                                          'Type',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )),
                                        Expanded(
                                            child: Text(
                                          comic.tipe,
                                          textAlign: TextAlign.right,
                                        ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: const EdgeInsets.only(
                                  top: 16.0,
                                  left: 8.0,
                                  bottom: 16.0,
                                  right: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    comic.judul,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Divider(),
                                  ...keyOfDetail.map((detail) {
                                    String keyToAccess = detail.key;
                                    return Container(
                                      margin: EdgeInsets.only(top: 12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text(
                                            detail.title,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            comic
                                                .getValue(keyToAccess)
                                                .toString(),
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  const Text(
                                    'Genre',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Wrap(
                                    spacing: 4,
                                    runSpacing: 4,
                                    children: comic.genres.map((genre) {
                                      return Container(
                                        padding: const EdgeInsets.symmetric(
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
                            ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
