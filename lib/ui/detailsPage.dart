import 'package:flutter/material.dart';
import 'package:timosh_app/models/car.dart';
import 'package:timosh_app/providers/Sort.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dotsIndicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailScreen();
  }
}



class _DetailScreen extends State<CarouselWithIndicatorDemo>  {
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 100);

  static const _kCurve = Curves.easeInOutQuart;

  final _kArrowColor = Colors.black.withOpacity(0.8);
  int _current = 0;
 static final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

 List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.network(item, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. ${imgList.indexOf(item)} image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )
    ),
  ),
)).toList();

  @override
  Widget build(BuildContext context) {
    final Car selectedCar = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        backgroundColor: Color(0xaa15202b).withOpacity(1),
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
          Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
          
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
            ),
          ),



          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]
      ),
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
                    convertTimeToString(selectedCar.dateCreated),
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
                "${convertCurrency(selectedCar.price)}" + r" $",
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
                    radius: 22,
                    backgroundColor: Color(0xff183047),
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
                      color: Color(0xff183047).withOpacity(1),
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
                                      "${convertCurrency(selectedCar.attributes[2].options[0])} км",
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
                      color: Color(0xff183047).withOpacity(1),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              right: 16, left: 16, top: 16),
                          child: Text(
                              removeAllHtmlTags(selectedCar.description),
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
        //Image.network(arr[i],fit: BoxFit.cover, width: double.infinity, height: double.infinity),

            FadeInImage.assetNetwork(
                                  placeholder: 'assets/450x450.jpg',
                                  image: /*arr[i],*/
                                      'https://topgir.com.ua/wp-content/uploads/2019/02/lamborghini-urus-%D0%B2-%D1%83%D0%BA%D1%80%D0%B0%D0%B8%D0%BD%D0%B5.jpg',
                                  fit: BoxFit.cover,
                         width: double.infinity, height: double.infinity
                                )
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.width * 1,
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
