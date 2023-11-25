import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:mangatale/model/comic.dart';
import 'package:mangatale/model/type_choice.dart';
import 'package:mangatale/shared/theme.dart';
import 'package:mangatale/ui/pages/detail_page.dart';
import 'package:mangatale/ui/widgets/rating_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 768) {
        return const DashboardWebPage();
      } else {
        return const DashboardMobilePage();
      }
    });
  }
}

List<Comic> popularComics(List<Comic> comics) {
  List<Comic> filteredComics =
      comics.where((comic) => comic.rate > 7.5).toList();
  return filteredComics;
}

List<Comic> filterComics(List<Comic> comics, int idFiltered) {
  if (idFiltered == 1) {
    return comics.toList();
  } else {
    TypeChoice? selectedTypeChoice =
        typeChoiceList.firstWhereOrNull((element) => element.id == idFiltered);
    String tipeFilteredTypeChoice = selectedTypeChoice?.label ?? "";
    return comics
        .where((comic) => comic.tipe == tipeFilteredTypeChoice)
        .toList();
  }
}

class PopularComicsWidget extends StatelessWidget {
  final List<Comic> comics;
  const PopularComicsWidget({Key? key, required this.comics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: comics.length,
        itemBuilder: (context, index) {
          final Comic comic = comics[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
                height: 250,
                width: 150,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(comic: comic);
                    }));
                  },
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  comic.poster,
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 4.0,
                                left: 4.0,
                                child: Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                      color: comic.tipe == 'Manhwa'
                                          ? mTipeManhwaColor
                                          : mTipeMangaColor,
                                      borderRadius: BorderRadius.circular(4.0)),
                                  child: Text(
                                    comic.tipe,
                                    style: TextStyle(
                                      color: mWhiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                comic.judul,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              const SizedBox(height: 4),
                              RatingBintangWidget(rating: comic.rate / 2)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}

class DashboardMobilePage extends StatefulWidget {
  const DashboardMobilePage({super.key});

  @override
  State<DashboardMobilePage> createState() => _DashboardMobilePageState();
}

class _DashboardMobilePageState extends State<DashboardMobilePage> {
  final List<TypeChoice> dataTypeChoice = typeChoiceList;
  var idSelectedTypeChoice = 1;
  final List<Comic> dataPopularComics = popularComics(comicList);

  @override
  Widget build(BuildContext context) {
    List<Comic> filteredComics = filterComics(comicList, idSelectedTypeChoice);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mPrimaryColor,
        title: SizedBox(
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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Popular Today',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 4,
            ),
            PopularComicsWidget(comics: dataPopularComics),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Project',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 4,
            ),
            Wrap(
              spacing: 8,
              children: dataTypeChoice.map((data) {
                bool isSelected = idSelectedTypeChoice == data.id;
                return ChoiceChip(
                  showCheckmark: false,
                  selectedColor: mPrimaryColor,
                  label: Text(
                    data.label,
                    style: TextStyle(
                        color: isSelected ? mWhiteColor : Colors.black),
                  ),
                  selected: isSelected,
                  onSelected: (_) =>
                      setState(() => idSelectedTypeChoice = data.id),
                );
              }).toList(),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 120 * filteredComics.length.toDouble(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredComics.length,
                itemBuilder: (context, index) {
                  final Comic comic = filteredComics[index];
                  return Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    height: 120,
                    width: double.infinity,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(comic: comic);
                          }));
                        },
                        child: Card(
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  comic.poster,
                                  fit: BoxFit.cover,
                                  width: 100,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
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
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 0),
                                              child: Text(
                                                comic.author,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: mSecondaryColor),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 4.0,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4.0),
                                            decoration: BoxDecoration(
                                                color: comic.tipe == 'Manhwa'
                                                    ? mTipeManhwaColor
                                                    : mTipeMangaColor,
                                                borderRadius:
                                                    BorderRadius.circular(4.0)),
                                            child: Text(
                                              comic.tipe,
                                              style: TextStyle(
                                                color: mWhiteColor,
                                              ),
                                            ),
                                          ),
                                          RatingBintangWidget(
                                              rating: comic.rate / 2)
                                        ],
                                      )
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

class DashboardWebPage extends StatefulWidget {
  const DashboardWebPage({super.key});

  @override
  State<DashboardWebPage> createState() => _DashboardWebPageState();
}

class _DashboardWebPageState extends State<DashboardWebPage> {
  final List<TypeChoice> dataTypeChoice = typeChoiceList;
  var idSelectedTypeChoice = 1;
  final List<Comic> dataPopularComics = popularComics(comicList);
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Comic> filteredComics = filterComics(comicList, idSelectedTypeChoice);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mPrimaryColor,
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
                      Scrollbar(
                          controller: _scrollController,
                          child: SizedBox(
                            height: 250,
                            child: ListView.builder(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: dataPopularComics.length,
                              itemBuilder: (context, index) {
                                final Comic comic = dataPopularComics[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                      height: 250,
                                      width: 150,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return DetailScreen(comic: comic);
                                          }));
                                        },
                                        child: Card(
                                          color: Colors.white,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        comic.poster,
                                                        height: double.infinity,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 4.0,
                                                      left: 4.0,
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        decoration: BoxDecoration(
                                                            color: comic.tipe ==
                                                                    'Manhwa'
                                                                ? mTipeManhwaColor
                                                                : mTipeMangaColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0)),
                                                        child: Text(
                                                          comic.tipe,
                                                          style: TextStyle(
                                                            color: mWhiteColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      comic.judul,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                    const SizedBox(height: 4),
                                                    RatingBintangWidget(
                                                        rating: comic.rate / 2)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                                );
                              },
                            ),
                          )),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const Text(
                        'Project',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Wrap(
                        spacing: 8,
                        children: dataTypeChoice.map((data) {
                          bool isSelected = idSelectedTypeChoice == data.id;
                          return ChoiceChip(
                            showCheckmark: false,
                            selectedColor: mPrimaryColor,
                            label: Text(
                              data.label,
                              style: TextStyle(
                                  color:
                                      isSelected ? mWhiteColor : Colors.black),
                            ),
                            selected: isSelected,
                            onSelected: (_) =>
                                setState(() => idSelectedTypeChoice = data.id),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        height: 500,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 6 / 2,
                          shrinkWrap: true,
                          children: filteredComics.map((comic) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailScreen(comic: comic);
                                  }));
                                },
                                child: Card(
                                  color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          comic.poster,
                                          fit: BoxFit.cover,
                                          width: 100,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 6.0, horizontal: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    comic.judul,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 4.0),
                                                    child: Text(
                                                      comic.author,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color:
                                                              mSecondaryColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                spacing: 4.0,
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    decoration: BoxDecoration(
                                                        color: comic.tipe ==
                                                                'Manhwa'
                                                            ? mTipeManhwaColor
                                                            : mTipeMangaColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0)),
                                                    child: Text(
                                                      comic.tipe,
                                                      style: TextStyle(
                                                        color: mWhiteColor,
                                                      ),
                                                    ),
                                                  ),
                                                  RatingBintangWidget(
                                                      rating: comic.rate / 2)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          }).toList(),
                        ),
                      )
                    ]),
              )),
        )));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
