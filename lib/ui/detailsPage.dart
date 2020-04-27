import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timosh_app/models/car.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:money2/money2.dart';
import 'dotsIndicator.dart';

class DetailScreen extends StatelessWidget {
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 100);

  static const _kCurve = Curves.easeInOutQuart;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    final Car selectedCar = ModalRoute.of(context).settings.arguments;

    _convertTimeToString(String dateCreated) {
      final difference =
          DateTime.now().difference(DateTime.parse(dateCreated)).inSeconds;
      if (difference <= 0) {
        dateCreated = 'зараз';
      } else if (difference < 60) {
        dateCreated = "${difference} сек. тому";
      } else if (difference < 3600) {
        dateCreated = "${(difference / 60).floor()} хв. тому";
      } else if (difference < 86400) {
        dateCreated = "${(difference / 3600).floor()} год. тому";
      } else if (difference < 604800) {
        dateCreated = "${(difference / 86400).floor()} дн. тому";
      } else if (difference < 2592000) {
        dateCreated = "${(difference / 604800).floor()} тиж. тому";
      } else if (difference < 31536000) {
        dateCreated = "${(difference / 2592000).floor()} міс. тому";
      } else if (difference > 31536000) {
        dateCreated = "${(difference / 31536000).floor()} рк. тому";
      }
      return dateCreated;
    }

    _removeAllHtmlTags(String htmlText) {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
      return htmlText.replaceAll(exp, '');
    }

    _convertCurrency(String currency) {
      Money costPrice =
          Money.fromInt(int.parse(currency), Currency.create('UAH', 0));
      return costPrice.format("###,###").replaceAll(',', ' ');
    }

    return Scaffold(
        backgroundColor: Color(0xaa15202b),
/*
   bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                    color: Color(0xff82cc00),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                        child: new FlatButton(
                      onPressed: () => launch("tel:${selectedCar.attributes[2].options[0]}"),
                      child: Container(
                        color: Color(0xff82cc00),
                        height: 50,
                        width: double.infinity,
                        child: Center(
                            child: new Text("Передзвонити",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.center)),
                      ),
                    ))))),
*/
        floatingActionButton: Container(
          height: 50,
          margin: EdgeInsets.only(left: 12, right: 12, bottom: 12),
          width: double.infinity,
          child: FloatingActionButton.extended(
            backgroundColor: Color(0xff82cc00),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            onPressed: () {
              launch("tel:${selectedCar.attributes[3].options[0]}");
            },
            label: Text(
              "Передзвонити",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 16),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: ListView(padding: EdgeInsets.all(0), children: [
          Stack(children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 0),
              itemCount: 1,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (index % 2 == 0) {
                  return _buildCarousel(context, 1);
                } else {
                  return Divider();
                }
              },
            ),
          ]),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, top: 12, right: 12),
              child: Text(
                selectedCar.name,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 6,
                  ),
                  child: Text(
                    _convertTimeToString(selectedCar.dateCreated),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 13),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    top: 6,
                  ),
                  child: Text(
                    '•',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 13),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    top: 6,
                  ),
                  child: Text(
                    "${selectedCar.metaData[0].value} переглядів",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 20,
              ),
              child: Text(
                "${_convertCurrency(selectedCar.price)}" + r" $",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 20,
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff82cc00),
                    child: IconButton(
                      icon: new Icon(
                        Icons.local_phone,
                        color: Colors.white,
                        size: 22.0,
                        semanticLabel: 'Звонок',
                      ),
                      onPressed: () {
                        launch("tel:${selectedCar.attributes[3].options[0]}");
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                        ),
                        child: Text(
                          selectedCar.attributes[1].options[0],
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 14),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          top: 3,
                        ),
                        child: Text(
                          selectedCar.attributes[3].options[0],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(
                right: 12,
                left: 12,
                top: 16,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      color: Color(0xff183047),
                      child: Table(
//          defaultColumnWidth:
//              FixedColumnWidth(MediaQuery.of(context).size.width / 3),
                        border: TableBorder.all(
                            color: Colors.black26,
                            width: 1,
                            style: BorderStyle.none),
                        children: [
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 16,
                                      left: 16,
                                    ),
                                    child: Text('Локація',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14)))),
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 16,
                                      right: 16,
                                    ),
                                    child: Text(
                                        selectedCar.attributes[0].options[0],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 14)))),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      top: 18,
                                    ),
                                    child: Text("Кузов",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14)))),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    right: 18,
                                  ),
                                  child: Text(
                                      selectedCar.attributes[14].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 14))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    left: 16,
                                  ),
                                  child: Text('Пробіг',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 14))),
                            ),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    right: 16,
                                  ),
                                  child: Text(
                                      "${_convertCurrency(selectedCar.attributes[2].options[0])} км",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 14))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 18,
                                      left: 16,
                                    ),
                                    child: Text('Топливо',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14)))),
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                top: 18,
                                right: 16,
                              ),
                              child: Text(selectedCar.attributes[4].options[0],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 14)),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      top: 18,
                                    ),
                                    child: Text("Об'єм двигуна",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14)))),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    right: 16,
                                  ),
                                  child: Text(
                                      selectedCar.attributes[5].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 14))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      top: 18,
                                    ),
                                    child: Text("Рік випуску",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14)))),
                            TableCell(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 18, right: 16),
                                  child: Text(
                                      selectedCar.attributes[6].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 14))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      top: 18,
                                    ),
                                    child: Text("Коробка",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14)))),
                            TableCell(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 18, right: 16),
                                  child: Text(
                                      selectedCar.attributes[7].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 14))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      top: 18,
                                    ),
                                    child: Text("Привід",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14)))),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    right: 16,
                                  ),
                                  child: Text(
                                      selectedCar.attributes[8].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 14))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      top: 18,
                                    ),
                                    child: Text("Колір",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14)))),
                            TableCell(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 18, right: 16),
                                  child: Text(
                                      selectedCar.attributes[9].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 14))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      top: 18,
                                    ),
                                    child: Text("Таможня",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 14)))),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18, right: 16, bottom: 16),
                                  child: Text(
                                      selectedCar.attributes[10].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 14))),
                            ),
                          ])
                        ],
                      )))),
          Padding(
              padding: const EdgeInsets.only(
                  right: 12, left: 12, top: 12, bottom: 78),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      color: Color(0xff183047),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 16, left: 16, top: 16),
                          child: Text(
                              _removeAllHtmlTags(selectedCar.description),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 14)))))),
        ]));
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    final Car selectedCar = ModalRoute.of(context).settings.arguments;
    var arr = selectedCar.attributes[15].options[0].split(' ');
    final List<Widget> _pages = <Widget>[
      for (var i = 0; i < arr.length; i++)
        Image.network(arr[i],
            fit: BoxFit.cover, width: double.infinity, height: double.infinity),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.width * 1.30,
          child: Stack(
            children: <Widget>[
              PageView.builder(
                // store this controller in a State to save the carousel scroll position
                controller: _controller,
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int itemIndex) {
                  return _pages[itemIndex % _pages.length];
                },
              ),
              Positioned(
                top: 42.0,
                left: 12.0,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xff183047).withOpacity(1),
                  child: IconButton(
                    icon: new Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                      semanticLabel: 'Назад',
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    child: new Container(
                      height: 12,
                      child: DotsIndicator(
                        controller: _controller,
                        itemCount: _pages.length,
                        onPageSelected: (int page) {
                          _controller.animateToPage(
                            page,
                            duration: _kDuration,
                            curve: _kCurve,
                          );
                        },
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
