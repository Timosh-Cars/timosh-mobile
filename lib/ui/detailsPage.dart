import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timosh_app/models/car.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dotsIndicator.dart';

class DetailScreen extends StatelessWidget {
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 100);

  static const _kCurve = Curves.easeInOutQuart;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    final Car selectedCar = ModalRoute.of(context).settings.arguments;


 final difference = DateTime.now().difference(DateTime.parse(selectedCar.dateCreated)).inSeconds;
String dateago = 'зараз';
  if(difference <= 0){dateago = 'зараз';}
  else if(difference < 60){dateago = "${difference.toString()} сек. тому";}
  else if(difference < 3600) {dateago = "${(difference/60).floor()} хв. тому";}
  else if(difference < 86400){dateago = "${(difference/3600).floor()} год. тому";}
  else if(difference < 604800){dateago = "${(difference/86400).floor()} дн. тому";}
  else if(difference < 2592000){dateago = "${(difference/604800).floor()} тиж. тому";}
  else if(difference < 31536000) {dateago = "${(difference/2592000).floor()} міс. тому";}
  else if(difference > 31536000) {dateago = "${(difference/31536000).floor()} рк. тому";}


    // Use the Todo to create the UI.
    return Scaffold(
        backgroundColor: Color(0xaa13213e),
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
                      onPressed: () => launch("tel:+380933887874"),
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
              padding: const EdgeInsets.only(left: 12, top: 12, right: 4),
              child: Text(
                selectedCar.name,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 22),
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
                     dateago,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 16),
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
                        fontSize: 16),
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
                        fontSize: 16),
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
                "${selectedCar.price} грн",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 22),
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
                    radius: 24,
                    backgroundColor: Color(0xff82cc00),
                    child: IconButton(
                      icon: new Icon(
                        Icons.local_phone,
                        color: Colors.white,
                        size: 26.0,
                        semanticLabel: 'Звонок',
                      ),
                      onPressed: () {
                        launch("tel:${selectedCar.attributes[2].options[0]}");
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
                              fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          top: 3,
                        ),
                        child: Text(
                          selectedCar.attributes[2].options[0],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 19),
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
                      color: Color(0xff264562),
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
                                      top: 18,
                                      left: 18,
                                    ),
                                    child: Text('Локація',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 16)))),
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 18,
                                      right: 18,
                                    ),
                                    child: Text(selectedCar.attributes[3].options[0],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 16)))),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                    ),
                                    child: Text("Кузов",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 16)))),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    right: 18,
                                  ),
                                  child: Text(selectedCar.attributes[15].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    left: 18,
                                  ),
                                  child: Text('Пробіг',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 16))),
                            ),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    right: 18,
                                  ),
                                  child: Text(selectedCar.attributes[0].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 18,
                                      left: 18,
                                    ),
                                    child: Text('Топливо',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 16)))),
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.only(
                                top: 18,
                                right: 18,
                              ),
                              child: Text(selectedCar.attributes[4].options[0],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 16)),
                            )),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                    ),
                                    child: Text("Об'єм двигуна",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 16)))),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    right: 18,
                                  ),
                                  child: Text(selectedCar.attributes[5].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                    ),
                                    child: Text("Рік випуску",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 16)))),
                            TableCell(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 18, right: 18),
                                  child: Text(selectedCar.attributes[6].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                    ),
                                    child: Text("Коробка",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 16)))),
                            TableCell(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 18, right: 18),
                                  child: Text(selectedCar.attributes[7].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                    ),
                                    child: Text("Привід",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 16)))),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 18,
                                    right: 18,
                                  ),
                                  child: Text(selectedCar.attributes[8].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                    ),
                                    child: Text("Колір",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 16)))),
                            TableCell(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 18, right: 18),
                                  child: Text(selectedCar.attributes[9].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16))),
                            ),
                          ]),
                          TableRow(children: [
                            TableCell(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 18,
                                      top: 18,
                                    ),
                                    child: Text("Таможня",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 16)))),
                            TableCell(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 18, right: 18, bottom: 18),
                                  child: Text(selectedCar.attributes[10].options[0],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                          fontSize: 16))),
                            ),
                          ])
                        ],
                      )))),
          Padding(
              padding: const EdgeInsets.only(
                  right: 12, left: 12, top: 12, bottom: 12),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      color: Color(0xff264562),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 18, left: 18, top: 18, bottom: 18),
                          child: Text(
                              selectedCar.description,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16)))))),
        ]));
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    final Car selectedCar = ModalRoute.of(context).settings.arguments;
    var arr = selectedCar.attributes[16].options[0].split(' ');
    final List<Widget> _pages = <Widget>[
      for (var i = 0; i < arr.length; i++)
        new ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
              arr[i],
              fit: BoxFit.fitHeight,
              width: double.infinity,
            )),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: <Widget>[
              Hero(
                  tag: 'imageHero' + selectedCar.id.toString(),
                  child: PageView.builder(
                    // store this controller in a State to save the carousel scroll position
                    controller: _controller,
                    itemCount: _pages.length,
                    itemBuilder: (BuildContext context, int itemIndex) {
                      return _pages[itemIndex % _pages.length];
                    },
                  )),
              Positioned(
                top: 55.0,
                left: 15.0,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.black.withOpacity(0.8),
                  child: IconButton(
                    icon: new Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 18,
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
                      left: 10,
                      right: 10,
                    ),
                    child: new Container(
                      height: 15,
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
