import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:mangatale/model/comic.dart';
import 'package:mangatale/model/type_choice.dart';
import 'package:mangatale/shared/theme.dart';
import 'package:mangatale/ui/pages/detail_page.dart';
import 'package:mangatale/ui/widgets/rating_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<TypeChoice> dataTypeChoice = typeChoiceList;
  var idSelectedTypeChoice = 1;
  final List<Comic> dataPopularComics = popularComics(comicList);

  @override
  Widget build(BuildContext context) {
    List<Comic> filteredComics = filterComics(comicList, idSelectedTypeChoice);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mPrimaryColor,
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
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailScreen(comic: comic);
                            }));
                          },
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      Positioned(
                                        bottom: 4.0,
                                        left: 4.0,
                                        child: Container(
                                          padding: EdgeInsets.all(4.0),
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
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 4),
                                      Text(
                                        comic.judul,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(height: 4),
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
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Project',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Wrap(
              children: dataTypeChoice.map((data) {
                bool isSelected = idSelectedTypeChoice == data.id;
                return ChoiceChip(
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
              spacing: 8,
            ),
            Container(
              height: 110 * filteredComics.length.toDouble(),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredComics.length,
                itemBuilder: (context, index) {
                  final Comic comic = filteredComics[index];
                  return Container(
                    padding: EdgeInsets.only(bottom: 8.0),
                    height: 110,
                    width: double.infinity,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(comic: comic);
                          }));
                        },
                        child: Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                child: Image.network(
                                  comic.poster,
                                  fit: BoxFit.cover,
                                  width: 100,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
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
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 4.0),
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
                                            padding: EdgeInsets.all(4.0),
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

List<Comic> popularComics(List<Comic> comics) {
  // Gunakan fungsi where untuk menyaring item yang sesuai kondisi
  List<Comic> filteredComics =
      comics.where((comic) => comic.rate > 7.5).toList();
  return filteredComics;
}

List<Comic> filterComics(List<Comic> comics, int idFiltered) {
  if (idFiltered == 1)
    return comics.toList();
  else {
    TypeChoice? selectedTypeChoice =
        typeChoiceList.firstWhereOrNull((element) => element.id == idFiltered);
    String tipeFilteredTypeChoice = selectedTypeChoice?.label ?? "";
    return comics
        .where((comic) => comic.tipe == tipeFilteredTypeChoice)
        .toList();
  }
}
