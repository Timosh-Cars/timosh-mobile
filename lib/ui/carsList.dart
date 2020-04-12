import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:timosh_app/models/car.dart';
import 'package:timosh_app/providers/carsProvider.dart';
import 'package:money2/money2.dart';
import 'detailsPage.dart';

class CarsList extends StatefulWidget {
  final List<Car> cars;
  CarsList({this.cars});
  @override
  State<StatefulWidget> createState() {
    return CarsListState(cars: cars);
  }
}

class CarsListState extends State<CarsList> {
  bool isLoading = false;
  int _offset = 1;
  final List<Car> cars;
  CarsProvider _carsProvider = CarsProvider();
  CarsListState({this.cars});

  _convertTimeToString(String dateCreated) {
    final difference = DateTime.now().difference(DateTime.parse(dateCreated)).inSeconds;
    if(difference <= 0){dateCreated = 'зараз';}
    else if(difference < 60){dateCreated = "${difference} сек. тому";}
    else if(difference < 3600) {dateCreated = "${(difference/60).floor()} хв. тому";}
    else if(difference < 86400){dateCreated = "${(difference/3600).floor()} год. тому";}
    else if(difference < 604800){dateCreated = "${(difference/86400).floor()} дн. тому";}
    else if(difference < 2592000){dateCreated = "${(difference/604800).floor()} тиж. тому";}
    else if(difference < 31536000) {dateCreated = "${(difference/2592000).floor()} міс. тому";}
    else if(difference > 31536000) {dateCreated = "${(difference/31536000).floor()} рк. тому";}
    return dateCreated;}

_convertCurrency(String currency) {
  
Money costPrice = Money.fromInt(int.parse(currency), Currency.create('UAH', 0));return costPrice.format("###,###").replaceAll(',', ' ');}
  
  _loadMoreCars() async {
    setState(() => isLoading = true);
    _offset++;
    var carsToAdd = await _carsProvider.fetchCars(_offset);
    setState(() {
      cars.addAll(carsToAdd);
    });
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      LazyLoadScrollView(
        
          onEndOfPage: () => _loadMoreCars(),
          scrollOffset: 100,
          child: ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(),
                    settings: RouteSettings(
                      arguments: cars[index],
                    ),
                  ),
                ),
                
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 20,
                        right: 12,
                      ),
                      // handle your onTap here
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Hero(
                              tag: 'imageHero' + cars[index].id.toString(),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/450x450.jpg',
                                image: cars[index]
                                    .attributes[15]
                                    .options[0]
                                    .split(' ')[0],
                              fit: BoxFit.cover,
                                 height: MediaQuery.of(context).size.height * 0.375,
                                width: double.infinity,
                              ))),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 6,
                          top: 8,
                        ),
                        child: Text(
                          cars[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 19),
                          overflow: TextOverflow.ellipsis,
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
                                left: 6,
                                top: 6,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                    "${_convertCurrency(cars[index].attributes[0].options[0])} км",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              '•',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              cars[index].attributes[6].options[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              '•',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              cars[index].attributes[5].options[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              '•',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 6,
                              top: 6,
                            ),
                            child: Text(
                              cars[index].attributes[4].options[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              top: 6,
                            ),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 16.0,
                              semanticLabel: 'Локація',
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 4,
                              top: 6,
                            ),
                            child: Text(
                              cars[index].attributes[3].options[0],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                top: 6,
                              ),
                              child: Text(
                                "${_convertCurrency(cars[index].price)} грн",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 20),
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 12,
                              top: 6,
                            ),
                            child: Text(
                              _convertTimeToString(cars[index].dateCreated),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          )),
      if (isLoading)
        Positioned(
          child: CircularProgressIndicator(),
          bottom: 30,
          left: MediaQuery.of(context).size.width / 2 - 20,
        )
    ]);
  }
}